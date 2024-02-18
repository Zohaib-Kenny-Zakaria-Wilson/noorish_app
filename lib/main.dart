import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:noorish_app/hooks/aladhan_api.dart';
import 'package:noorish_app/hooks/barcode_api.dart';
import 'package:noorish_app/mocks/ingredients_mock.dart';
import 'package:noorish_app/models/day.dart';
import 'package:noorish_app/pages/calendar_page.dart';
import 'package:noorish_app/pages/day_page.dart';
import 'package:noorish_app/pages/reciepe_page.dart';
import 'package:noorish_app/style.dart';

void main() async {
  MockIngredient.ingredients[0].updateNutriments();
  runApp(
    MaterialApp(
      home: DefaultTabController(
        length: 2, // Number of tabs
        child: Scaffold(
          body: TabBarView(
            children: [
              CalendarPage(month: DateTime.now().month),
              DayPage(
                  dayNumber: DateTime.now().day, month: DateTime.now().month),
            ],
          ),
          bottomNavigationBar: BottomAppBar(
            color: Styles.backgroundColor,
            child: TabBar(
              tabs: [
                Tab(
                    icon: Icon(Icons.calendar_today_rounded,
                        color: Styles.secondaryColor, size: 30.0)),
                Tab(
                    icon: Icon(Icons.home_filled,
                        color: Styles.secondaryColor, size: 30.0)),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
