// lib/colors.dart
import 'package:flutter/material.dart';

class AppColors {
  static const Color customPink = Color(0xFFE36DA6);
  static const Color customBlue = Color(0xFF262F71);
  static const Color customLightPink = Color(0xFFF5B5CF);
  static const Color customSuperLightBlue = Color(0xFF80abdb);
  static const Color customLightBlue = Color(0xFF0098d0);

  // Optionally, create a MaterialColor if you need different shades
  static const int _customPinkPrimaryValue = 0xFFE36DA6;

  static const MaterialColor customPinkMaterial = MaterialColor(
    _customPinkPrimaryValue,
    <int, Color>{
      50: Color(0xFFFCE4EC),
      100: Color(0xFFF8BBD0),
      200: Color(0xFFF48FB1),
      300: Color(0xFFF06292),
      400: Color(0xFFEC407A),
      500: Color(_customPinkPrimaryValue),
      600: Color(0xFFEC407A),
      700: Color(0xFFE91E63),
      800: Color(0xFFD81B60),
      900: Color(0xFFC2185B),
    },
  );

  // Add cursor color
  static const Color cursorColor = Color(0xFFE36DA6);
}
