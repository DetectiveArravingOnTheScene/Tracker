import 'package:cristalyse/cristalyse.dart';
import 'package:flutter/material.dart';
import 'package:tracker_app/domain/entities/tracking_entry.dart';
import 'package:tracker_app/domain/entities/tracking_entity.dart';

class TrackingCard extends StatelessWidget {
  final TrackingEntity entity;

  const TrackingCard({super.key, required this.entity});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(entity.title, style: Theme.of(context).textTheme.titleMedium),
          SizedBox(height: 16),
          Container(
            constraints: BoxConstraints(maxHeight: 200),
            child: CristalyseChart()
                .data(map(entity.values))
                .mapping(x: 'date', y: 'value')
                .geomLine(strokeWidth: 3)
                .geomPoint(size: 4)
                .scaleXOrdinal()
                .scaleYContinuous(min: 0)
                .build(),
          ),
        ],
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
