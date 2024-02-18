import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:noorish_app/hooks/aladhan_api.dart';
import 'package:noorish_app/models/day.dart';
import 'package:noorish_app/style.dart';
import 'package:noorish_app/mocks/user_mock.dart';

void main() async {
  // List<dynamic> jsonData = await makeApiCall(MockUser().lat, MockUser().long);

  // print(jsonData);
  Day day = Day();
  await day.updatePrayerTimes();
  print(await day.prayerTimes);

  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("Hi!", style: Style.fonts),
      ),
    ),
  ));
}
