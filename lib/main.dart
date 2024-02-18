import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:noorish_app/hooks/aladhan_api.dart';
import 'package:noorish_app/style.dart';
import 'package:noorish_app/mocks/user_mock.dart';

void main() async {
  // String result = await makeApiCall(MockUser().lat, MockUser().long);
  // print(result);
  // String jsonString = result;

  Object jsonData = makeApiCall(MockUser().lat, MockUser().long);
  // Map<String, String> prayerTimes = {};

  // var timings = jsonData[0]['timings'];
  // prayerTimes['Fajr'] = timings['Fajr'];
  // prayerTimes['Dhuhr'] = timings['Dhuhr'];
  // prayerTimes['Asr'] = timings['Asr'];
  // prayerTimes['Maghrib'] = timings['Maghrib'];
  // prayerTimes['Isha'] = timings['Isha'];

  print(jsonData);

  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("Hi!", style: Style.fonts),
      ),
    ),
  ));
}
