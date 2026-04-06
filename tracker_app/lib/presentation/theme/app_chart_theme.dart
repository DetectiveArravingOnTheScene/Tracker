import 'package:cristalyse/cristalyse.dart';
import 'package:flutter/material.dart';
import 'package:tracker_app/presentation/theme/app_colors.dart';
import 'package:tracker_app/presentation/theme/app_fonts.dart';

class AppChartTheme {
  static ChartTheme darkTheme() {
    return ChartTheme(
      backgroundColor: AppColors.background,
      plotBackgroundColor: AppColors.background,
      primaryColor: AppColors.primary,
      borderColor: AppColors.background,
      gridColor: AppColors.background,
      axisColor: AppColors.hintColor,
      gridWidth: 1,
      axisWidth: 1,
      pointSizeDefault: 1,
      pointSizeMin: 4,
      pointSizeMax: 4,
      colorPalette: [AppColors.primary],
      padding: EdgeInsets.only(left: 16),
      axisTextStyle: AppFonts.hintText.copyWith(color: Colors.white),
      axisLabelStyle: AppFonts.hintText.copyWith(color: AppColors.hintColor),
    );
  }
}
