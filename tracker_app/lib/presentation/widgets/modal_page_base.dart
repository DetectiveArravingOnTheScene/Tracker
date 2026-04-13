import 'package:flutter/material.dart';
import 'package:tracker_app/presentation/theme/theme_context_extension.dart';

class ModalPageBase extends StatelessWidget {
  final String title;
  final Widget child;
  const ModalPageBase({super.key, required this.child, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 520),
          child: Material(
            borderRadius: BorderRadius.circular(24),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: .min,
                children: [
                  SizedBox(height: 12),
                  Text(title, style: context.textTheme.titleLarge),
                  SizedBox(height: 12),
                  child,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
