import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Colors.lightBlue,
    primary: Colors.grey.shade100,
    secondary: Colors.grey.shade100,
    inversePrimary: Colors.grey.shade100,
  ),
  textTheme: ThemeData.light().textTheme.apply(
    bodyColor: Colors.grey[800],
    displayColor: Colors.black,
  ),

  );