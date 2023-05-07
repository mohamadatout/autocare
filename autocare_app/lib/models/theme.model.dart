import 'package:autocare_app/helpers/color.constructor.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  static final ThemeData lightMode = ThemeData(
    appBarTheme: const AppBarTheme(
        textTheme: TextTheme(displaySmall: TextStyle(fontSize: 14))),
    scaffoldBackgroundColor: Colors.white,
    primarySwatch: createMaterialColor(const Color.fromARGB(255, 187, 50, 51)),
    accentColor: const Color.fromARGB(255, 217, 217, 217),
    cardColor: const Color.fromARGB(255, 246, 246, 246),
    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
    textTheme: const TextTheme(
      // AutoCare Logo Display
      displayLarge: TextStyle(
        fontSize: 50,
        color: Colors.white,
        fontFamily: "race",
      ),
      // AppBar Titles
      displayMedium: TextStyle(
        fontSize: 14,
        color: Colors.black,
        fontFamily: "sora",
      ),
      // Inputs
      labelSmall: TextStyle(
        fontSize: 14,
        fontFamily: "sora",
        color: Color.fromARGB(255, 100, 100, 100),
      ),
      // Welcoming Title
      titleLarge: TextStyle(
        fontSize: 30,
        fontFamily: "Sora",
        fontWeight: FontWeight.w500,
      ),
      // Welcoming Text - Continue with Google
      titleMedium: TextStyle(
        fontSize: 16,
        fontFamily: "Sora",
        fontWeight: FontWeight.w400,
      ),
      titleSmall: TextStyle(),
      //
      bodyLarge: TextStyle(),
      bodyMedium: TextStyle(),
      bodySmall: TextStyle(),
    ),
  );
}
