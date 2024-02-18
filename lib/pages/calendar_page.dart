import 'package:flutter/material.dart';
import 'package:noorish_app/models/day.dart';
import 'package:noorish_app/pages/day_page.dart';
import 'package:noorish_app/style.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CalendarPage extends StatelessWidget {
  final int month;
  final int year =
      DateTime.now().year; // Assuming you're using the current year

  CalendarPage({Key? key, required this.month}) : super(key: key);

  // Function to generate day labels
  Widget _buildDayLabels() {
    List<String> dayLabels = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: dayLabels
          .map((label) => Expanded(
                child: Container(
                  padding: EdgeInsets.all(8),
                  alignment: Alignment.center,
                  child: Text(label,
                      style: Styles.baseTextStyle
                          .copyWith(color: Styles.secondaryColor)),
                ),
              ))
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final daysInMonth = DateUtils.getDaysInMonth(year, month);
    final today = DateTime.now();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${Day.monthToString(month)} $year',
          style: Styles.baseTextStyle.copyWith(fontSize: 20.0),
        ),
        backgroundColor: Styles.backgroundColor, // Set the AppBar color
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        color: Styles.backgroundColor, // Set background color here
        child: Column(
          children: [
            _buildDayLabels(), // Add the day labels here
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                  childAspectRatio:
                      1.2, // Adjust the aspect ratio for square cells
                  crossAxisSpacing: 4, // Spacing between the cells
                  mainAxisSpacing: 4,
                ),
                itemCount: daysInMonth,
                itemBuilder: (context, index) {
                  final dayNumber = index + 1;
                  final isToday =
                      today.month == month && today.day == dayNumber;

                  return GestureDetector(
                    onTap: () => _openDayPage(context, dayNumber),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1), // Shadow color
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(0, 2), // Shadow position
                          ),
                        ],
                        color: isToday
                            ? Styles.secondaryColor
                            : Styles.foregroundColor, // Highlight today's date
                        borderRadius:
                            BorderRadius.circular(8), // Rounded corners
                      ),
                      child: Text(
                        '$dayNumber',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: isToday
                              ? FontWeight.bold
                              : FontWeight.normal, // Bold for today's date
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/images/noorish_logo.png', // Replace with your PNG image asset
                height: 50.0, // Set the height (adjust as needed)
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _openDayPage(BuildContext context, int dayNumber) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DayPage(dayNumber: dayNumber, month: month),
      ),
    );
  }
}
