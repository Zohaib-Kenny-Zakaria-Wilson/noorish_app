import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:noorish_app/style.dart';
import 'package:noorish_app/mocks/user_mock.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("Hello World!", style: Style.fonts),
      ),
    ),
  ));
}
