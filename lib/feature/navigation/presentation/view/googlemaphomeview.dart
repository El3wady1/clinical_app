import 'dart:async';
import 'package:appnote/core/utils/widgetsstyle.dart';
import 'package:appnote/feature/Doctor/setclincLocation/data/service/updateclincLoc.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geocoding/geocoding.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../../../core/widgets/showsnackbar.dart';

class clinc_Location extends StatefulWidget {
  @override
  _MapMarkerScreenState createState() => _MapMarkerScreenState();
}

class _MapMarkerScreenState extends State<clinc_Location> {
  GoogleMapController? _mapController;
  Set<Marker> _markers = {};
  LatLng _initialPosition = LatLng(30.751751016702237, 31.45048842145807); // Default position
  BitmapDescriptor? _customMarker;
  TextEditingController _searchController = TextEditingController();
  Position? _position;
  Completer<GoogleMapController> _controller = Completer();
  Set<Polyline> polylines = {};

  @override
  void initState() {
    super.initState();
    initializeState();
  }

  Future<void> initializeState() async {
    await getPermission();
    await getMyCurrentLocation();
    await fetchMarkersFromFirestore();
  }

  Future<void> getPermission() async {
    PermissionStatus permission = await Permission.location.request();
    if (!permission.isGranted) {
      showfalseSnackBar(
        context: context,
        message: "Location permission denied",
        icon: Icons.warning,
      );
    }
  }

  Future<void> getMyCurrentLocation() async {
    _position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    if (_position != null) {
      setState(() {
        _markers.add(Marker(
          markerId: MarkerId('currentLocation'),
          position: LatLng(_position!.latitude, _position!.longitude),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        ));
      });
    }
  }

  Future<void> fetchMarkersFromFirestore() async {
    try {
      DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
          .collection('clincLoc')
          .doc('loc')
          .get();

      if (docSnapshot.exists) {
        var data = docSnapshot.data() as Map<String, dynamic>;

        if (data.containsKey('lat') && data.containsKey('lang')) {
          double lat = data['lat'];
          double lang = data['lang'];
          LatLng clinicPosition = LatLng(lat, lang);

          setState(() {
            _initialPosition = clinicPosition; // Update initial position
            _markers.add(Marker(
              markerId: MarkerId('clinicLocation'),
              position: clinicPosition,
              icon: _customMarker ?? BitmapDescriptor.defaultMarker,
            ));

            // Draw polyline between current location and clinic location
            if (_position != null) {
              drawPolyline(LatLng(_position!.latitude, _position!.longitude), clinicPosition);
            }
          });
        }
      }
    } catch (e) {
      print("Error fetching markers: $e");
    }
  }

  void drawPolyline(LatLng start, LatLng end) {
    setState(() {
      polylines.clear(); // Clear existing polylines if needed
      polylines.add(Polyline(
        polylineId: PolylineId('${start.latitude},${start.longitude}'), // Unique ID for the polyline
        visible: true,
        points: [start, end],
        color: Colors.blue,
        width: 5,
      ));
    });
  }

  Future<void> _goToMyCurrentLocation() async {
    if (_position != null) {
      final GoogleMapController controller = await _controller.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(_position!.latitude, _position!.longitude),
          zoom: 17.0,
        ),
      ));
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _initialPosition,
              zoom: 15,
            ),
            markers: _markers,
            polylines: polylines,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: FloatingActionButton(
                backgroundColor: Colors.blue.shade800,
                onPressed: () => _goToMyCurrentLocation(),
                child: Icon(Icons.my_location_sharp, color: Colors.white),
              ),

            ),

          ),
          Positioned(
              top: 18,
              left: 10,
              right: 10,
              child: Text(
                  textAlign:TextAlign.center,
                  " ... برجاء الانتظار لتحميل موقعك و موقع العيادة ...")),

        ],
      ),
    );
  }
}
