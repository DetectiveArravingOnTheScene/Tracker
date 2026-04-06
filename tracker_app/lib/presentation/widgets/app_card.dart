import 'package:flutter/material.dart';
import 'package:tracker_app/presentation/theme/app_colors.dart';

class AppCard extends StatelessWidget {
  final Widget child;

  const AppCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: BoxBorder.fromLTRB(
          top: BorderSide(color: AppColors.white),
          left: BorderSide(color: AppColors.hintColor),
          right: BorderSide(color: AppColors.hintColor),
        ),
      ),
      child: child,
    );
  }
}
