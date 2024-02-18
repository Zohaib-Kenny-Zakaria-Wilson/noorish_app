import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:noorish_app/mocks/meals_mock.dart';
import 'package:noorish_app/models/meal.dart';
import 'package:noorish_app/style.dart';

class DayPage extends StatefulWidget {
  const DayPage({super.key});

  @override
  State<DayPage> createState() => _DayPageState();
}

class _DayPageState extends State<DayPage> {
  List<Meal> meals = MockMeal.meals;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.backgroundColor,
      body: Container(
        alignment: Alignment.topCenter,
        child: FloatingActionButton.small(
          backgroundColor: Styles.backgroundColor,
          child: Text('+'),
          onPressed: () => null,
        ),
      ),
    );
  }
}
