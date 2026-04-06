import 'package:cristalyse/cristalyse.dart';
import 'package:flutter/material.dart';
import 'package:tracker_app/domain/entities/trackitng_entity.dart';

final List<TrackingEntity> mockData = [
  DoubleTrackingEntity(
    datatype: .double,
    title: "Test stat",
    values: [
      TrackingValue(
        time: DateTime.now().subtract(Duration(days: 2)),
        value: 10,
      ),
      TrackingValue(
        time: DateTime.now().subtract(Duration(days: 1)),
        value: 12,
      ),
      TrackingValue(time: DateTime.now(), value: 14),
    ],
  ),
];

List<Map<String, dynamic>> _map(List<TrackingValue> list) {
  final List<Map<String, dynamic>> result = [];

  for (var item in list) {
    Map<String, dynamic> value = {'date': item.time, 'value': item.value};
    result.add(value);
  }

  return result;
}

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              for (var item in mockData)
                Expanded(
                  child: Container(
                    child: Column(
                      children: [
                        Text(item.title),
                        Expanded(
                          child: CristalyseChart()
                              .data(_map(mockData.first.values))
                              .mapping(x: 'date', y: 'value')
                              .geomLine(strokeWidth: 3)
                              .geomPoint(size: 4)
                              .scaleXOrdinal()
                              .scaleYContinuous(min: 0)
                              .build(),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
