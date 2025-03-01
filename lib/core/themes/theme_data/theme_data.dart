import 'package:flutter/material.dart';

ThemeData theLightTheme() {
  return ThemeData(
    scaffoldBackgroundColor: Color(0xFF303030),
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xFF303030),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.blueGrey.shade400,
    ),
  );
}
