import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:noorish_app/hooks/aladhan_api.dart';
import 'package:noorish_app/models/day.dart';
import 'package:noorish_app/pages/calendar_page.dart';
import 'package:noorish_app/pages/day_page.dart';
import 'package:noorish_app/pages/reciepe_page.dart';
import 'package:noorish_app/style.dart';

void main() async {
  // List<dynamic> jsonData = await makeApiCall(MockUser().lat, MockUser().long);

  // print(jsonData);
  Day day = Day();
  await day.updatePrayerTimes();
  print(await day.prayerTimes);

  runApp(
    MaterialApp(
      home: DefaultTabController(
        length: 3, // Number of tabs
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 46, 103, 156),
            title: Text(
              'Noorish',
              textAlign: TextAlign.center,
              style: Styles.headline1,
            ),
          ),
          body: const TabBarView(
            children: [
              Calendar(),
              DayPage(),
              Recipe(),
            ],
          ),
          bottomNavigationBar: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.calendar_today_rounded)),
              Tab(icon: Icon(Icons.home_filled)),
              Tab(icon: Icon(Icons.list_alt_rounded)),
            ],
            padding: EdgeInsets.all(16.0),
          ),
        ),
      ),
    ),
  );
}
