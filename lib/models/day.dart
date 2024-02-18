import 'package:noorish_app/mocks/user_mock.dart';
import 'package:noorish_app/models/ramadan.dart';
import 'package:noorish_app/models/user.dart';

class Day {
  int day; // Make this non-final to allow initialization with constructor
  int month;
  List<String> prayerTimes = [];
  final User user = MockUser();
  // List<Meal> meals;

  // Modify constructor to accept a day number
  Day({required this.day, required this.month});

  Future<void> updatePrayerTimes() async {
    List<dynamic> ramadanDays = await Ramadan.getRamadanDays();
    List<String> prayers = [];
    int index;

    // Use 'date' directly since it's now being initialized with the desired day number
    if (day >= 11 && day <= 31) {
      index = day - 11;
    } else {
      index = day + 20;
    }

    prayers.add(ramadanDays[index]['timings']['Fajr']);
    prayers.add(ramadanDays[index]['timings']['Dhuhr']);
    prayers.add(ramadanDays[index]['timings']['Asr']);
    prayers.add(ramadanDays[index]['timings']['Maghrib']);
    prayers.add(ramadanDays[index]['timings']['Isha']);

    prayerTimes = prayers;
  }

  static String monthToString(int month) {
    switch (month) {
      case 1:
        return "January";
      case 2:
        return "February";
      case 3:
        return "March";
      case 4:
        return "April";
      case 5:
        return "May";
      case 6:
        return "June";
      case 7:
        return "July";
      case 8:
        return "August";
      case 9:
        return "September";
      case 10:
        return "October";
      case 11:
        return "November";
      case 12:
        return "December";
      default:
        return "Invalid month";
    }
  }
}
