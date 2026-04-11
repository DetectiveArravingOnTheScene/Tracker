import 'package:cristalyse/cristalyse.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tracker_app/domain/entities/tracking_entry.dart';
import 'package:tracker_app/domain/entities/tracking_entity.dart';
import 'package:tracker_app/presentation/theme/app_chart_theme.dart';
import 'package:tracker_app/presentation/theme/app_fonts.dart';
import 'package:tracker_app/presentation/widgets/app_card.dart';

class TrackingCard extends StatelessWidget {
  final TrackingEntity entity;

  const TrackingCard({super.key, required this.entity});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(entity.title, style: AppFonts.titleMedium),
            SizedBox(height: 16),
            Container(
              constraints: BoxConstraints(maxHeight: 200),
              child: CristalyseChart()
                  .data(map(entity.values))
                  .mapping(x: 'date', y: 'value')
                  .geomLine(strokeWidth: 3)
                  .geomPoint(size: 4)
                  .scaleXOrdinal()
                  .theme(AppChartTheme.darkTheme())
                  .scaleYContinuous(min: 0)
                  .build(),
            ),
          ],
        ),
      ),
    );
  }
}

List<Map<String, dynamic>> map(List<TrackingEntry> list) {
  final List<Map<String, dynamic>> result = [];

  for (var item in list) {
    Map<String, dynamic> value = {
      'date': item.time.toString(),
      'value': item.value,
    };
    result.add(value);
  }

  return result;
}
