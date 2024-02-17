import 'package:noorish_app/hooks/aladhan_api.dart';
import 'package:noorish_app/mocks/user_mock.dart';
import 'package:noorish_app/models/user.dart';

class Day {
  final DateTime sunriseTime;
  final DateTime sunsetTime;
  final List<DateTime> prayerTimes;
  final User user = MockUser();
//   List<Meal> meals;

  Day()
      // required this.meals;
      : sunriseTime = getSunriseTime(),
        sunsetTime = getSunsetTime(),
        prayerTimes = getPrayerTimes();

  Day.blank()
      : sunriseTime = DateTime.now(), // fix the times to pull from API
        sunsetTime = DateTime.now(),
        prayerTimes = [];

  static DateTime getSunriseTime() {
    return DateTime(2024, 2, 12, 6, 0, 0);
  }

  static DateTime getSunsetTime() {
    return DateTime(2024, 2, 12, 6, 0, 0);
  }

  static List<DateTime> getPrayerTimes() {
    List<DateTime> prayerTimes = [];
    return prayerTimes;
  }
}
