import 'dart:convert';

import 'package:appnote/core/utils/endpoint.dart';
import 'package:http/http.dart' as http;

Future<List<dynamic>> GethealthNews({required bool isArabic}) async {
  final response = await http.get(isArabic==true?Uri.parse(EndpointUrl.endpointofnewseg):Uri.parse(EndpointUrl.endpointofnewsus));
  if (response.statusCode == 200) {
    final Map<String, dynamic> responseData = json.decode(response.body);
    return responseData['articles'];
  } else {
    throw Exception('Failed to load news');
  }
}
