import 'package:appnote/core/utils/widgetsstyle.dart';
import 'package:appnote/feature/Doctor/setclincLocation/data/service/updateclincLoc.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Setclinc_Location extends StatefulWidget {
  @override
  _Setclinc_LocationState createState() => _Setclinc_LocationState();
}

class _Setclinc_LocationState extends State<Setclinc_Location> {
  GoogleMapController? _mapController;
  Set<Marker> _markers = {};
  LatLng _initialPosition = LatLng(30.751751016702237, 31.45048842145807);
  BitmapDescriptor? _customMarker;

  TextEditingController _searchController = TextEditingController();
  List<dynamic> _searchResults = [];
  bool _isLoading = false; // Loading indicator variable

  @override
  void initState() {
    super.initState();
    _loadCustomMarker();
    _fetchClinicLocation(); // Fetch location on init
  }

  // Method to load custom marker image
  void _loadCustomMarker() async {
    _customMarker = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(devicePixelRatio: 4),
      'assets/icons/doctorr.png',
    );
  }

  // Method to fetch clinic location from Firestore
  Future<void> _fetchClinicLocation() async {
    try {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('clincLoc')
          .doc('loc')
          .get();

      if (snapshot.exists) {
        double lat = snapshot['lat'];
        double lang = snapshot['lang'];

        setState(() {
          _initialPosition = LatLng(lat, lang);
          _markers.add(
            Marker(
              markerId: MarkerId('clinicLocation'),
              position: _initialPosition,
              icon: _customMarker ?? BitmapDescriptor.defaultMarker,
            ),
          );
        });
      }
    } catch (e) {
      print('Error fetching clinic location: $e');
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  void _handleTap(LatLng tappedPoint) {
    setState(() {
      _markers.clear();
      _markers.add(
        Marker(
          markerId: MarkerId(tappedPoint.toString()),
          position: tappedPoint,
          icon: _customMarker ?? BitmapDescriptor.defaultMarker,
        ),
      );
    });

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(16),
          height: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'تأكيد مكان العيادة ؟',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  UpdateClincLoc(
                    lat: tappedPoint.latitude,
                    lang: tappedPoint.longitude,
                    context: context,
                  );
                  Navigator.pop(context);
                },
                child: Text('تأكيد'),
              ),
            ],
          ),
        );
      },
    );
  }

  // Method to search location using Google Places API
  Future<void> _searchLocation(String query) async {
    setState(() {
      _isLoading = true; // Start loading
    });

    final String apiKey = 'AIzaSyCqifU6y1rTPSLCi0MqySgF36S764pwoVw'; // Replace with your Google Places API key
    final String url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$query&key=$apiKey';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _searchResults = data['predictions'];
        });
      } else {
        print('Error fetching search results: ${response.body}');
      }
    } catch (e) {
      print('Exception occurred: $e');
    } finally {
      setState(() {
        _isLoading = false; // Stop loading
      });
    }
  }

  void _onSearchTap(String placeId) async {
    // Fetch place details using the place ID
    final String apiKey = 'AIzaSyCqifU6y1rTPSLCi0MqySgF36S764pwoVw'; // Replace with your Google Places API key
    final String detailUrl =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$apiKey';

    try {
      final response = await http.get(Uri.parse(detailUrl));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final location = data['result']['geometry']['location'];
        final LatLng newLocation = LatLng(location['lat'], location['lng']);

        setState(() {
          _markers.clear(); // Clear previous markers
          _markers.add(
            Marker(
              markerId: MarkerId(newLocation.toString()),
              position: newLocation,
              icon: _customMarker ?? BitmapDescriptor.defaultMarker,
            ),
          );

          _mapController?.animateCamera(CameraUpdate.newLatLng(newLocation)); // Move camera to new location
          _searchResults.clear(); // Clear results after selection
          _searchController.clear(); // Clear search input
        });
      } else {
        print('Error fetching place details: ${response.body}');
      }
    } catch (e) {
      print('Exception occurred: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: WidgetsStyles.AppbarStylee,
        centerTitle: true,
        title: Text(
          "وضع عنوان العيادة",
          style: TextStyle(
              fontWeight: FontWeight.w900, fontSize: 20, color: Colors.white),
        ),
      ),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _initialPosition,
              zoom: 15,
            ),
            markers: _markers,
            onTap: _handleTap,
          ),
          Positioned(
            top: 10,
            left: 10,
            right: 10,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [BoxShadow(blurRadius: 5, color: Colors.black12)],
                ),
                child: Column(
                  children: [
                    TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Search Location',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 15),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () {
                            _searchLocation(_searchController.text);
                          },
                        ),
                      ),
                    ),
                    if (_isLoading) // Show loading indicator
                      CircularProgressIndicator(),
                    if (_searchResults.isNotEmpty)
                      Container(
                        height: 200, // Adjust as needed
                        child: ListView.builder(
                          itemCount: _searchResults.length,
                          itemBuilder: (context, index) {
                            final result = _searchResults[index];
                            return ListTile(
                              title: Text(result['description']),
                              onTap: () {
                                _onSearchTap(result['place_id']); // Fetch location details
                              },
                            );
                          },
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
