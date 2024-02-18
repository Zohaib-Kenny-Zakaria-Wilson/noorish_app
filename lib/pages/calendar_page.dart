import 'package:flutter/material.dart';
import 'package:noorish_app/pages/day_page.dart';

class CalendarPage extends StatelessWidget {
    const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7,
        ),
        itemCount: 31, // 7x5 grid
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
        builder: (context) => DayPage(dayNumber: dayNumber),
      ),
    );
  }
}
