import 'package:http/http.dart' as http;

Future<String> makeApiCall(double latitude, double longitude) async {
  final String latitudeString = (latitude) as String;
  final String longitudeString = (longitude) as String;
  final url = Uri.parse(
      'http://api.aladhan.com/v1/hijriCalendar/1445/09?latitude=' +
          latitudeString +
          '&longitude=' +
          longitudeString +
          '&method=4');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    // API call successful
    return (response.body);
  } else {
    // API call failed
    return ('API call failed with status code: ${response.statusCode}');
  }
}
