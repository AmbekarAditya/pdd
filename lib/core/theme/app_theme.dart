import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF607D8B), // Blue Grey
      surface: const Color(0xFFF5F5F5), // Light Grey Surface
      surfaceContainer: const Color(0xFFEEEEEE),
      onSurface: const Color(0xFF212121),
      primary: const Color(0xFF455A64), // Darker Grey-Blue
      secondary: const Color(0xFF78909C), // Lighter Grey-Blue
    ),
    scaffoldBackgroundColor: const Color(0xFFFAFAFA), // Very light grey
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: Color(0xFFF5F5F5),
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Color(0xFF212121),
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
