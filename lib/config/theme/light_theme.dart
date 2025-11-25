import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,

  // BACKGROUND COLOR
  scaffoldBackgroundColor: const Color.fromARGB(255, 241, 191, 160),

  // COLOR SCHEME
  colorScheme: const ColorScheme.light(
    primary: Color(0xFF11224E),
    secondary: Color(0xFF11224E),
    surface: Color(0xFFFFA354),
    onSurface: Color(0xFF11224E),
  ),

  // APP BAR SAME AS BACKGROUND
  appBarTheme: const AppBarTheme(
    backgroundColor: const Color.fromARGB(255, 241, 193, 157),
    foregroundColor: Color(0xFF11224E),
    elevation: 0,
    scrolledUnderElevation: 0,
    centerTitle: true,
  ),

  // TEXT THEME
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      color: Color(0xFF11224E),
      fontWeight: FontWeight.bold,
    ),
    bodyMedium: TextStyle(
      color: Color(0xFF11224E),
    ),
    bodySmall: TextStyle(
      color: Color(0xFF11224E),
    ),
  ),

  // ICON THEME
  iconTheme: const IconThemeData(
    color: Color(0xFF11224E),
  ),

  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xFF11224E),
    foregroundColor: Colors.white,
  ),
);
