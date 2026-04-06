import 'package:flutter/material.dart';
import 'package:tracker_app/presentation/theme/app_colors.dart';

class AppFonts {
  // Massive Headers (e.g., Splash screens, onboarding)
  static const TextStyle displayLarge = TextStyle(
    color: AppColors.white,
    fontSize: 32,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.5,
  );

  // Page Titles / App Bar
  static const TextStyle titleLarge = TextStyle(
    color: AppColors.white,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
  );

  // Section Headers
  static const TextStyle titleMedium = TextStyle(
    color: AppColors.white,
    fontSize: 18,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.25,
  );

  // Main Body Text (Articles, descriptions)
  static const TextStyle bodyLarge = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 16,
    fontWeight: FontWeight.normal,
    height: 1.5, // Improves readability for blocks of text
  );

  // Secondary Body Text (Subtitles, list item descriptions)
  static const TextStyle bodyMedium = TextStyle(
    color: AppColors.textSecondary,
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  // Hint Text (Input fields, placeholders)
  static const TextStyle hintText = TextStyle(
    color: AppColors.hintColor,
    fontSize: 14,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.italic,
  );

  // Button Text
  static const TextStyle buttonText = TextStyle(
    color: AppColors.black, // Dark text on primary cyan button
    fontSize: 16,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.5,
  );

  // Captions / Overlines (Timestamps, tiny labels)
  static const TextStyle caption = TextStyle(
    color: AppColors.textSecondary,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
  );
}
