import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//  light mode
ThemeData lightMode = ThemeData(
  fontFamily: GoogleFonts.outfit().fontFamily,
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    surface: Color(0xFFEEF1FF),
    primary: Color(0xFFB1B2FF),
    secondary: Color(0xFFAAC4FF),
    tertiary: Color(0xFFD2DAff),
  ),
);

//  dark mode
ThemeData darkMode = ThemeData(
  fontFamily: GoogleFonts.outfit().fontFamily,
  useMaterial3: true,
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    surface: Color(0xFF1B262C),
    primary: Color(0xFF0F4C75),
    secondary: Color(0xFF3282B8),
    tertiary: Color(0xFFBBE1FA),
  ),
);
