import 'dart:convert';

import 'package:http/http.dart' as http;

Future<List<dynamic>> makeApiCall(double latitude, double longitude) async {
  final String latitudeString = latitude.toString();
  final String longitudeString = longitude.toString();
  final url = Uri.parse(
      'http://api.aladhan.com/v1/hijriCalendar/1445/09?latitude=' +
          latitudeString +
          '&longitude=' +
          longitudeString +
          '&method=4');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    // API call successful
    List<dynamic> output = json.decode(response.body)['data'];
    return output;
  } else {
    // API call failed
    return [];
  }
}
