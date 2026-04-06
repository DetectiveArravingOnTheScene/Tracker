import 'package:flutter/material.dart';

class AppColors {
  // Backgrounds & Surfaces
  static const Color background = Color(0xFF121212); // Deep OLED-friendly black
  static const Color surface = Color(
    0xFF1E1E1E,
  ); // Lighter shade for cards/surfaces
  static const Color inputFill = Color(
    0xFF2C2C2C,
  ); // Distinct text field background

  // Brand & Accents
  static const Color primary = Color(0xFF00E5FF); // Sleek Cyan
  static const Color secondary = Color(0xFF8A2BE2); // Deep Purple
  static const Color error = Color(
    0xFFCF6679,
  ); // Standard Material error red/pink

  // Text & Elements
  static const Color textPrimary = Color(0xFFE0E0E0);
  static const Color textSecondary = Color(0xFFB3B3B3);
  static const Color iconColor = Colors.white;
  static const Color hintColor = Color(0xFF888888);

  // Absolute Colors
  static const Color white = Colors.white;
  static const Color black = Colors.black;
}
