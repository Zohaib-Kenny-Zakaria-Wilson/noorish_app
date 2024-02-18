import 'package:noorish_app/hooks/aladhan_api.dart';
import 'package:noorish_app/mocks/user_mock.dart';

class Ramadan {
  static final List<Map> ramadanDays =
      makeApiCall(MockUser().lat, MockUser().long)
          as List<Map<dynamic, dynamic>>;

  Ramadan();

  static List<Map> getRamadanDays() {
    return ramadanDays;
  }
}
