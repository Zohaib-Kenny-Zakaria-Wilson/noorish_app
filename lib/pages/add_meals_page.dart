import 'package:flutter/material.dart';
import 'package:noorish_app/models/day.dart';

class AddMeal extends StatefulWidget {
  final Day currentDay;
  AddMeal(this.currentDay);

  @override
  State<AddMeal> createState() => _AddMealState(this.currentDay);
}

class _AddMealState extends State<AddMeal> {
  final Day day;
  _AddMealState(this.day);
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
