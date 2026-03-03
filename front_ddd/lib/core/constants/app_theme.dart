import 'package:flutter/material.dart';

class AppTheme {
  // Couleurs Dakar Dem Dikk (blanc avec accents vert, jaune, rouge)
  static const Color white = Color(0xFFFFFFFF);
  static const Color green = Color(0xFF009639); // Vert Sénégal
  static const Color yellow = Color(0xFFFDB913); // Jaune Sénégal
  static const Color red = Color(0xFFE31E24); // Rouge Sénégal
  static const Color lightGray = Color(0xFFF5F5F5);
  static const Color darkGray = Color(0xFF333333);

  static ThemeData get theme {
    return ThemeData(
      scaffoldBackgroundColor: white,
      primaryColor: white,
      colorScheme: ColorScheme.light(
        primary: white,
        secondary: green,
        surface: lightGray,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: white,
        foregroundColor: darkGray,
        elevation: 1,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: green,
          foregroundColor: white,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      cardTheme: CardThemeData(
        color: white,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: lightGray, width: 1),
        ),
      ),
    );
  }
}
