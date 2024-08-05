import 'package:flutter/material.dart';

class ThemesApp {
  static ThemeData _baseTheme({
    required TextTheme textTheme,
    required ColorScheme colorScheme,
    required IconThemeData iconTheme,
    required bool useMaterial3,
  }) {
    return ThemeData(
      textTheme: textTheme,
      colorScheme: colorScheme,
      iconTheme: iconTheme,
      useMaterial3: useMaterial3,
    );
  }

  static ThemeData lightTheme() {
    return _baseTheme(
      textTheme: const TextTheme(
        titleLarge: TextStyle(fontSize: 15, fontFamily: "Montserrat", fontWeight: FontWeight.w400),
        titleMedium: TextStyle(fontSize: 16, fontFamily: "Montserrat", fontWeight: FontWeight.normal),
        bodyMedium: TextStyle(fontSize: 14, fontFamily: "OpenSans", fontWeight: FontWeight.normal),
      ),
      colorScheme: const ColorScheme.light(
        background: Color(0xFFFFFFFF),
        onBackground: Color(0xFF000000),
        primary: Color(0xFF213D6F),
        onPrimary: Color(0xFFFFFFFF),
        secondary: Color.fromRGBO(33, 61, 111, 1.0),
        onSecondary: Color(0xFF000000),
        tertiary: Color(0xFF808080),
        error: Color(0xFFFF0000),
        outline: Color(0xFFC0C0C0),
      ),
      iconTheme: const IconThemeData(color: Colors.white),
      useMaterial3: true,
    );
  }

  static ThemeData darkTheme() {
    return _baseTheme(
      textTheme: const TextTheme(
        titleLarge: TextStyle(fontSize: 15, fontFamily: "Montserrat", fontWeight: FontWeight.bold),
        titleMedium: TextStyle(fontSize: 16, fontFamily: "Montserrat", fontWeight: FontWeight.normal),
        bodyMedium: TextStyle(fontSize: 14, fontFamily: "OpenSans", fontWeight: FontWeight.normal),
      ),

      colorScheme: const ColorScheme.dark(
        tertiary: Color(0xFF808080),
        secondary: Color(0xffbb86fc),
      ),
      iconTheme: const IconThemeData(color: Colors.white),
      useMaterial3: true,
    );
  }
}