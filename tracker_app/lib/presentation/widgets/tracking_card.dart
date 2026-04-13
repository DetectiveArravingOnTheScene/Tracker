import 'package:cristalyse/cristalyse.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tracker_app/domain/entities/tracking_entry.dart';
import 'package:tracker_app/domain/entities/tracking_entity.dart';
import 'package:tracker_app/domain/service/tracking_service.dart';
import 'package:tracker_app/presentation/pages/add_entry_dialog.dart';

class TrackingCard extends StatelessWidget {
  final TrackingEntity entity;

  const TrackingCard({super.key, required this.entity});

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      elevation: 1,
      clipBehavior: Clip.hardEdge,
      child: Column(
        children: [
          SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                SizedBox(width: 4),
                Text(
                  entity.title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Spacer(),
                IconButton.filled(
                  onPressed: () async {
                    final rawValue = await showDialog<String>(
                      context: context,
                      builder: (context) {
                        return AddEntryDialog();
                      },
                    );

                    if (rawValue == null) return;

                    final value = double.tryParse(rawValue);

                    if (value == null) return;

                    context.read<TrackingService>().addEntry(
                      TrackingEntry<double>(
                        id: null,
                        entityId: entity.id!,
                        time: DateTime.now(),
                        value: value,
                      ),
                    );
                  },
                  icon: Icon(Icons.add),
                ),
              ],
            ),
          ),
          SizedBox(height: 12),
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
