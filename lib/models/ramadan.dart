import 'package:noorish_app/hooks/aladhan_api.dart';
import 'package:noorish_app/mocks/user_mock.dart';

class Ramadan {
  static final Future<List<dynamic>> ramadanDays =
      makeApiCall(MockUser().lat, MockUser().long);

  Ramadan();

  static Future<List<dynamic>> getRamadanDays() {
    return ramadanDays;
  }
}
