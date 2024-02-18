import 'package:noorish_app/models/day.dart';

class MockDay extends Day {
  MockDay() : super(prayerTimes: [], updatePrayerTimes: () {});
  final prayerTimes = [
    '05:17 (CDT)', // Fajr
    '13:28 (CDT)', // Dhuhr
    '17:08 (CDT)', // Asr
    '20:01 (CDT)', // Maghrib
    '22:01 (CDT)', // Isha
  ];
}
