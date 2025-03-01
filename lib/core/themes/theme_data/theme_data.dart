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
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(color: const Color.fromARGB(255, 177, 165, 165)),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: const Color.fromARGB(255, 177, 165, 165)),
        borderRadius: BorderRadius.circular(16),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.blueGrey.shade400,
    ),
  );
}
