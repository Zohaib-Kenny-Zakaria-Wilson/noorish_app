import 'package:flutter/material.dart';
import 'package:noorish_app/models/day.dart';
import 'package:noorish_app/pages/day_page.dart';
import 'package:noorish_app/style.dart';

class CalendarPage extends StatelessWidget {
  final int month;

  const CalendarPage({Key? key, required this.month}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${Day.monthToString(month)}',
          style: Styles.baseTextStyle.copyWith(fontSize: 20.0),
        ),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7,
        ),
        itemCount: 28, // 7x5 grid
        itemBuilder: (context, index) {
          // Adding 1 to index since you may want to start the calendar from day 1
          int dayNumber = index + 1;
          return GestureDetector(
            onTap: () {
              _openDayPage(context, dayNumber);
            },
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                '$dayNumber',
                style: TextStyle(fontSize: 18),
              ),
            ),
          );
        },
      ),
    );
  }

  void _openDayPage(BuildContext context, int dayNumber) {
    // Navigate to the corresponding day page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DayPage(dayNumber: dayNumber, month: month),
      ),
    );
  }
}
