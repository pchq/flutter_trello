import 'package:flutter/material.dart';

class ThemeConstants {
  static const Color primaryColor = Color(0xFF63ffd7);

  static final ThemeData appTheme = ThemeData(
    colorScheme: ColorScheme(
      primary: primaryColor,
      primaryVariant: primaryColor.withAlpha(220),
      secondary: Colors.greenAccent,
      secondaryVariant: Colors.greenAccent.withAlpha(220),
      surface: Colors.grey.shade800,
      background: Colors.black,
      error: Colors.red,
      onPrimary: Colors.black,
      onSecondary: Colors.black,
      onSurface: Colors.white,
      onBackground: Colors.white,
      onError: Colors.red,
      brightness: Brightness.dark,
    ),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: Colors.black,
      contentTextStyle: TextStyle(color: Colors.white),
    ),
  );
}
