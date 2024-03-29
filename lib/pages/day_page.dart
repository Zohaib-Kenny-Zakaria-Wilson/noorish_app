import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:noorish_app/components/nutrition_progress_bar.dart';
import 'package:noorish_app/mocks/meals_mock.dart';
import 'package:noorish_app/models/day.dart';
import 'package:noorish_app/models/meal.dart';
import 'package:noorish_app/models/nutrition_data.dart';
import 'package:noorish_app/pages/add_meals_page.dart';
import 'package:noorish_app/style.dart';

class DayPage extends StatefulWidget {
  final int dayNumber;
  final int month;

  const DayPage({Key? key, required this.dayNumber, required this.month})
      : super(key: key);

  @override
  State<DayPage> createState() => _DayPageState();
}

class _DayPageState extends State<DayPage> {
  late Day day;

  @override
  void initState() {
    super.initState();
    initializeDay(); // No need to await here
  }

  Future<void> initializeDay() async {
    try {
      // Initialize your day here based on widget.dayNumber and widget.month
      day = Day(day: widget.dayNumber, month: widget.month);

      await day.updatePrayerTimes();

      // Call setState to trigger a rebuild with the updated prayer times.
      if (mounted) {
        setState(() {});
      }
    } catch (error) {
      // Consider logging the error or showing a message to the user.
      print("Error updating prayer times: $error");
    }
  }

  List<Meal> meals =
      MockMeal.meals; // Assuming this returns a list of Meal objects
  final List<NutrientData> nutrients = [
    NutrientData(name: "Calories", currentValue: 1200, maxValue: 2000),
    NutrientData(name: "Protein", currentValue: 50, maxValue: 100),
    NutrientData(name: "Carbs", currentValue: 70, maxValue: 100),
    NutrientData(name: "Fats", currentValue: 30, maxValue: 100),
  ];

  @override
  Widget build(BuildContext context) {
    String sunriseTime = "Loading...";
    String sunsetTime = "Loading...";

    // Ensure prayerTimes has at least 5 elements (Fajr, Dhuhr, Asr, Maghrib, Isha)
    if (day.prayerTimes.length >= 5) {
      sunriseTime = day.prayerTimes[0].toString().substring(
          0, sunriseTime.length - 5); // Assuming Fajr time is sunrise
      sunsetTime =
          '${day.prayerTimes[3].toString().substring(0, sunriseTime.length)}'; // Assuming Maghrib time is sunset
    }

    return Scaffold(
      backgroundColor: Styles.backgroundColor,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 16.0), // Add padding horizontally
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/images/noorish_logo.png',
                height: 20.0,
              ),
              Text(
                '${Day.monthToString(day.month)} ${day.day}th',
                style: Styles.baseTextStyle.copyWith(fontSize: 20.0),
              ),
            ],
          ),
        ),
        backgroundColor: Styles.backgroundColor,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(4.0),
          child: Container(
            height: 1.0,
            color: Color.fromARGB(45, 124, 136, 138),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _renderTodayMacros(context, nutrients),
              Padding(
                padding: EdgeInsets.all(24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //SunRise
                    Container(
                        decoration: BoxDecoration(
                          color: Styles.foregroundColor, // Background color
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color:
                                  Colors.grey.withOpacity(0.1), // Shadow color
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: Offset(0, 2), // Shadow position
                            ),
                          ],
                        ),
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.sunny,
                                  size: 60.0,
                                  color: Styles.sunRiseTextColor,
                                ),
                                SizedBox(width: 8),
                                Column(
                                  children: [
                                    Text('SUN',
                                        style: Styles.prayerBoldText.copyWith(
                                            color: Styles.sunRiseTextColor)),
                                    Text('RISE',
                                        style: Styles.prayerLightText.copyWith(
                                            color: Styles.sunRiseTextColor)),
                                  ],
                                )
                              ],
                            ),
                            Text(
                              '${sunriseTime}',
                              style: Styles.prayerMediumText,
                            ),
                          ],
                        )),
                    //SunSet
                    Container(
                        decoration: BoxDecoration(
                          color: Styles.foregroundColor, // Background color
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color:
                                  Colors.grey.withOpacity(0.1), // Shadow color
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: Offset(0, 2), // Shadow position
                            ),
                          ],
                        ),
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.dark_mode,
                                  size: 60.0,
                                  color: Styles.primaryColor,
                                ),
                                SizedBox(width: 8),
                                Column(
                                  children: [
                                    Text('SUN',
                                        style: Styles.prayerBoldText.copyWith(
                                            color: Styles.primaryColor)),
                                    Text('SET',
                                        style: Styles.prayerLightText.copyWith(
                                            color: Styles.primaryColor)),
                                  ],
                                )
                              ],
                            ),
                            Text(
                              '$sunsetTime',
                              style: Styles.prayerMediumText,
                            ),
                          ],
                        )),
                  ],
                ),
              ),
              _renderMealContainer(context, meals),
            ],
          ),
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
      onPressed: () => _navMeal(context, this.day),
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
        .fold<double>(0, (sum, current) => sum + current.calories);

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
      MaterialPageRoute(builder: (context) => AddMeal(day)),
    );
  }
}
