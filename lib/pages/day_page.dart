import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:noorish_app/components/nutrition_progress_bar.dart';
import 'package:noorish_app/mocks/day_mock.dart';
import 'package:noorish_app/mocks/meals_mock.dart';
import 'package:noorish_app/models/day.dart';
import 'package:noorish_app/models/meal.dart';
import 'package:noorish_app/models/nutrition_data.dart';
import 'package:noorish_app/pages/add_meals_page.dart';
import 'package:noorish_app/style.dart';

class DayPage extends StatefulWidget {
  final int dayNumber;

  const DayPage({required this.dayNumber});

  @override
  State<DayPage> createState() => _DayPageState();
}

class _DayPageState extends State<DayPage> {
  List<Meal> meals =
      MockMeal.meals; // Assuming this returns a list of Meal objects
  Day today = Day();
  final List<NutrientData> nutrients = [
    NutrientData(name: "Calories", currentValue: 1200, maxValue: 2000),
    NutrientData(name: "Protein", currentValue: 50, maxValue: 100),
    NutrientData(name: "Carbs", currentValue: 70, maxValue: 100),
    NutrientData(name: "Fats", currentValue: 30, maxValue: 100),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _renderTodayMacros(context, nutrients),
            _renderMealContainer(context, meals),
          ],
        ),
      ),
    );
  }

  Widget _renderTodayMacros(
      BuildContext context, List<NutrientData> nutrients) {
    return Column(children: [
      Padding(
        padding: EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 0.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text("Today's Macros", style: Styles.headline1),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          color: Styles.foregroundColor, // Background color
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1), // Shadow color
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 2), // Shadow position
            ),
          ],
        ),
        margin: EdgeInsets.all(24.0),
        padding: EdgeInsets.fromLTRB(0.0, 24.0, 0.0, 24.0),
        child: Column(
          children: nutrients
              .map<Widget>((data) => NutrientProgressBar(
                  data: data)) // Specify <Widget> to ensure type correctness
              .toList(),
        ),
      )
    ]);
  }

  Widget _renderMealContainer(BuildContext context, List<Meal> meals) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text('Meals', style: Styles.headline1),
          ),
          const SizedBox(height: 16.0), // Gap after "Meals" title
          _renderAddMealButton(context),
          const SizedBox(height: 16.0), // Gap after "Add Meal" button
          // Instead of using Expanded, directly include the meal items as part of the column.
          // This approach avoids using ListView.builder directly under SingleChildScrollView.
          ...meals.map((meal) => _renderMeal(context, meal)).toList(),
        ],
      ),
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
            style: Styles.descriptiveTextStyle
                .copyWith(color: Styles.primaryTextColor),
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
      child: Container(
        decoration: BoxDecoration(
          color: Colors
              .white, // Set the background color of the Container to white
          borderRadius: BorderRadius.circular(10), // Rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1), // Shadow color
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 2), // Shadow position
            ),
          ],
        ),
        child: ListTile(
          leading: const Icon(Icons.fastfood), // Example icon
          title: Text(meal.name,
              style: Styles.baseTextStyle
                  .copyWith(color: Styles.secondaryColor)), // Display meal name
          subtitle: Text('Calories: $totalCalories',
              style: Styles.descriptiveTextStyle), // Example detail
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
