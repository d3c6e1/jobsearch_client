import 'package:flutter/material.dart';

class ThemeConfig{
  //Colors for theme
  static Color lightPrimary = Colors.white;
  static Color lightAccent = Color(0xFFd3c6e1);
  static Color lightBG = Colors.white;

  static ThemeData lightTheme = ThemeData(
    backgroundColor: lightBG,
    primaryColor: lightPrimary,
    accentColor:  lightAccent,
    cursorColor: lightAccent,
    scaffoldBackgroundColor: lightBG,
    appBarTheme: AppBarTheme(
      elevation: 0,
      textTheme: TextTheme(
        headline6: TextStyle(
          color: lightBG,
          fontSize: 20,
          fontWeight: FontWeight.w800,
        ),
      ),
    ),
  );
}