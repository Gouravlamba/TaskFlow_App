import 'package:flutter/material.dart';

final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,

  // BACKGROUND COLOR
  scaffoldBackgroundColor: const Color.fromARGB(255, 3, 15, 44),

  // COLOR SCHEME
  colorScheme: const ColorScheme.dark(
    primary: Colors.white,
    secondary: Colors.white,
    surface: Color(0xFF1A2C63),
    onSurface: Colors.white,
  ),

  // APP BAR SAME AS BACKGROUND
  appBarTheme: const AppBarTheme(
    backgroundColor: const Color.fromARGB(255, 1, 14, 46),
    foregroundColor: Colors.white,
    elevation: 0,
    centerTitle: true,
    scrolledUnderElevation: 0,
  ),

  // TEXT STYLES
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    bodyMedium: TextStyle(color: Colors.white),
    bodySmall: TextStyle(color: Colors.white70),
  ),

  // ICONS WHITE
  iconTheme: const IconThemeData(
    color: Colors.white,
  ),

  // FLOATING ACTION BUTTON
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.white,
    foregroundColor: Color(0xFF11224E),
  ),
);
