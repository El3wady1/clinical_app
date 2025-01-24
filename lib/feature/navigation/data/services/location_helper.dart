// ignore_for_file: duplicate_import, avoid_print, non_constant_identifier_names, unused_local_variable, camel_case_types, unused_import, duplicate_ignore

import 'dart:convert' as convert;

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';

class LocationHelper {
  static Future<Position> getCurrentLocation() async {
    bool isServiceEnable = await Geolocator.isLocationServiceEnabled();
    await Geolocator.checkPermission();
    await Geolocator.openLocationSettings();

    if (!isServiceEnable) {
      await Geolocator.requestPermission();
    }
    var status = await Permission.location.status;
    if (status.isGranted) {
      print('Location is granted');
    }else {
      print('Location is not granted');
    }
    Map<Permission , PermissionStatus> Status = await [
      Permission.location,
    ].request();
    if(await Permission.location.isPermanentlyDenied){
      openAppSettings();
    }

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

}

class locationService {
  final String key = 'AIzaSyCqifU6y1rTPSLCi0MqySgF36S764pwoVw';
  Future getPlaceID(String input) async {
    final String url =
        'https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=$input&inputtype=textquery&key=$key';

    var response = await http.get(Uri.parse(url));

    var json = convert.jsonDecode(response.body);
    var placeId = json['candidates'][0]['place_id'] as String;
    return placeId;
  }

  Future<Map<String, dynamic>> getPlace(String input) async {
    final placeId = await getPlaceID(input);
    final String url =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$key ';
    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var results = json['result'] as Map<String, dynamic>;
    return results;
  }
}
