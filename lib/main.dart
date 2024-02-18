import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:noorish_app/pages/calendar_page.dart';
import 'package:noorish_app/pages/day_page.dart';
import 'package:noorish_app/pages/reciepe_page.dart';
import 'package:noorish_app/style.dart';
import 'package:noorish_app/mocks/user_mock.dart';

void main() {
  runApp(MaterialApp(
    home: DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 46, 103, 156),
          title: const Text(
            'NOORISH',
            textAlign: TextAlign.center,
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
  ));
}
