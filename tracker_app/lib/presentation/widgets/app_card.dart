import 'package:flutter/material.dart';
import 'package:tracker_app/presentation/theme/app_colors.dart';

class AppCard extends StatelessWidget {
  final Widget child;

  const AppCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFFFFFFF), // Top/Left (shine)
            Color(0xFFCBD5E1), // Center/Right (medium-light)
            Color(0xFF475569), // Bottom/Right (shadow)
          ],
          stops: [0.0, 0.5, 1.0],
        ),
      ),
      padding: const EdgeInsets.all(1), // Acts as the border width
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surface, // Masks the center of the gradient
          // Subtract the padding (4) from the outer radius (16)
          // for a perfectly concentric curve!
          borderRadius: BorderRadius.circular(16),
        ),
        child: child,
      ),
    );
  }
}
