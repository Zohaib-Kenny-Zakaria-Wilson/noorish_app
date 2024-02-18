import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:noorish_app/hooks/aladhan_api.dart';
import 'package:noorish_app/style.dart';
import 'package:noorish_app/mocks/user_mock.dart';

void main() async {
  String result = await makeApiCall(MockUser().lat, MockUser().long);
  print(result);
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text(result, style: Style.fonts),
      ),
    ),
  ));
}
