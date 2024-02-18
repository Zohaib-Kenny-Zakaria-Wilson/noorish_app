import 'package:noorish_app/mocks/user_mock.dart';
import 'package:noorish_app/models/ramadan.dart';
import 'package:noorish_app/models/user.dart';

class Day {
  final int date = DateTime.now().day;
  List<String> prayerTimes = [];
  final User user = MockUser();
//   List<Meal> meals;

  Day();

  Future<void> updatePrayerTimes() async {
    List<dynamic> ramadanDays = await Ramadan.getRamadanDays();
    List<String> prayers = [];
    int index;
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
