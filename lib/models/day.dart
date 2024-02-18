import 'package:noorish_app/mocks/user_mock.dart';
import 'package:noorish_app/models/ramadan.dart';
import 'package:noorish_app/models/user.dart';

class Day {
  int date; // Make this non-final to allow initialization with constructor
  List<String> prayerTimes = [];
  final User user = MockUser();
  // List<Meal> meals;

  // Modify constructor to accept a day number
  Day({required this.date});

  Future<void> updatePrayerTimes() async {
    List<dynamic> ramadanDays = await Ramadan.getRamadanDays();
    List<String> prayers = [];
    int index;

    // Use 'date' directly since it's now being initialized with the desired day number
    if (date >= 11 && date <= 31) {
      index = date - 11;
    } else {
      index = date + 20;
    }

    prayers.add(ramadanDays[index]['timings']['Fajr']);
    prayers.add(ramadanDays[index]['timings']['Dhuhr']);
    prayers.add(ramadanDays[index]['timings']['Asr']);
    prayers.add(ramadanDays[index]['timings']['Maghrib']);
    prayers.add(ramadanDays[index]['timings']['Isha']);

    prayerTimes = prayers;
  }
}
