import 'package:noorish_app/mocks/user_mock.dart';
import 'package:noorish_app/models/user.dart';

class Day {
  final DateTime sunriseTime;
  final DateTime sunsetTime;
  List<DateTime> prayerTimes;
  final User user = MockUser();
//   List<Meal> meals;

  Day({
    required this.prayerTimes,
  })  : sunriseTime = prayerTimes.isNotEmpty ? prayerTimes[0] : DateTime.now(),
        sunsetTime = prayerTimes.isNotEmpty
            ? prayerTimes[prayerTimes.length - 1]
            : DateTime.now();

  Day.blank({
    List<DateTime> prayerTimes = const [],
    DateTime? sunriseTime,
    DateTime? sunsetTime,
  })  : prayerTimes = prayerTimes,
        sunriseTime = sunriseTime ?? DateTime.now(),
        sunsetTime = sunsetTime ?? DateTime.now();
}
