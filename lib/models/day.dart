import 'package:noorish_app/mocks/user_mock.dart';
import 'package:noorish_app/models/ramadan.dart';
import 'package:noorish_app/models/user.dart';

class Day {
  final int date = DateTime.now().day;
  List<String> prayerTimes;
  final User user = MockUser();
//   List<Meal> meals;

  Day({
    required this.prayerTimes,
    required updatePrayerTimes(),
  });

  void updatePrayerTimes() {
    List<Map> ramadanDays = Ramadan.getRamadanDays();
    int index;
    if (this.date >= 11 && this.date <= 31) {
      index = date - 11;
    } else {
      index = date + 20;
    }

    this.prayerTimes.add(ramadanDays[index]['timings']['Fajr']);
    this.prayerTimes.add(ramadanDays[index]['timings']['Dhuhr']);
    this.prayerTimes.add(ramadanDays[index]['timings']['Asr']);
    this.prayerTimes.add(ramadanDays[index]['timings']['Maghrib']);
    this.prayerTimes.add(ramadanDays[index]['timings']['Isha']);
  }
}
