import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tracker_app/domain/service/tracking_service.dart';
import 'package:tracker_app/presentation/pages/main_page.dart';
import 'package:tracker_app/presentation/theme/app_theme.dart';

class MainApp extends StatelessWidget {
  final TrackingService service;
  const MainApp({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TrackingService>.value(
      value: service,
      child: MaterialApp(
        theme: AppTheme.light,
        home: MainPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
