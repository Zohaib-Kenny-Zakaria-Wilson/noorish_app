import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:noorish_app/mocks/day_mock.dart';
import 'package:noorish_app/mocks/meals_mock.dart';
import 'package:noorish_app/models/day.dart';
import 'package:noorish_app/models/meal.dart';
import 'package:noorish_app/pages/add_meals_page.dart';
import 'package:noorish_app/style.dart';

class DayPage extends StatefulWidget {
  const DayPage({super.key});

  @override
  State<DayPage> createState() => _DayPageState();
}

class _DayPageState extends State<DayPage> {
  List<Meal> meals =
      MockMeal.meals; // Assuming this returns a list of Meal objects
  Day today = Day();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Styles.backgroundColor,
        body: _renderMealContainer(context, meals));
  }

  Widget _renderMealContainer(BuildContext context, meals) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text('Meals', style: Styles.headline1),
        ),
        const SizedBox(height: 16.0), // Gap after button
        _renderAddMealButton(context),
        const SizedBox(height: 16.0), // Gap after button
        Expanded(
          child: _renderMealList(context, meals),
        ),
      ]),
    );
  }

  Widget _renderAddMealButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(10), // Explicitly making corners rounded
        ),
        backgroundColor: Styles.secondaryColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.add,
            color: Styles.primaryTextColor,
          ),
          Text(
            'ADD MEAL',
            style: Styles.baseTextStyle,
          )
        ],
      ),
      onPressed: () => _navMeal(context, today),
    );
  }

  Widget _renderMealList(BuildContext context, List<Meal> meals) {
    return ListView.builder(
      itemCount: meals.length,
      itemBuilder: (context, index) => _renderMeal(context, meals[index]),
    );
  }

  Widget _renderMeal(BuildContext context, Meal meal) {
    final totalCalories = meal.ingredientsList
        .fold<int>(0, (sum, current) => sum + current.calories);

    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(10), // Explicitly making corners rounded
        ),
        child: ListTile(
          leading: const Icon(Icons.fastfood), // Example icon
          title: Text(meal.name,
              style: Styles.baseTextStyle
                  .copyWith(color: Styles.secondaryColor)), // Display meal name
          subtitle: Text(
            'Calories: $totalCalories',
            style: Styles.descriptiveTextStyle,
          ), // Example detail
          onTap: () {
            // Handle tap if needed, for example to edit the meal
          },
        ),
      ),
    );
  }

  void _navMeal(BuildContext context, Day day) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddMeal(today), // can be used in
      ),
    );
  }
}
