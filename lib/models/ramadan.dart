import 'package:noorish_app/models/day.dart';

class Ramadan {
  final List<Day> days;

  Ramadan({
    required this.days,
  });

  Ramadan.blank() : days = [];
}
