import 'package:flutter/material.dart';
import 'package:tracker_app/presentation/pages/main_page.dart';
import 'package:tracker_app/presentation/theme/app_theme.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: AppThemes.modernDarkTheme, home: MainPage());
  }
}
