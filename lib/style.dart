import 'package:flutter/material.dart';

class Styles {
  static final Color backgroundColor = Color.fromARGB(255, 243, 248, 255);
  static final Color primaryTextColor = Color.fromARGB(255, 30, 30, 30);

  ///TextStyles
  ///TextStyles
  ///TextStyles

  //Font Setter
  static const String _fontNameDefault = 'Futura';

  // Define base text style
  static final TextStyle baseTextStyle = TextStyle(
    fontFamily: _fontNameDefault,
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    color: primaryTextColor,
  );

  // Specific text styles
  static final TextStyle headline1 = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w500,
    color: primaryTextColor,
  );

  ///TextStyles
  ///TextStyles
  ///TextStyles

  // Add more specific styles as needed...
}
