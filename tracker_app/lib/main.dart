import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tracker_app/app.dart';
import 'package:tracker_app/domain/entities/tracking_entry.dart';
import 'package:tracker_app/domain/entities/trackitng_entity.dart';

final List<TrackingEntity> mockData = [
  DoubleTrackingEntity(
    datatype: .double,
    title: "Test stat 1",
    values: [
      TrackingEntry(
        time: DateTime.now().subtract(Duration(days: 2)),
        value: 10,
      ),
      TrackingEntry(
        time: DateTime.now().subtract(Duration(days: 1)),
        value: 12,
      ),
      TrackingEntry(time: DateTime.now(), value: 14),
    ],
  ),
  DoubleTrackingEntity(
    datatype: .double,
    title: "Test stat 2",
    values: [
      TrackingEntry(
        time: DateTime.now().subtract(Duration(days: 2)),
        value: 10,
      ),
      TrackingEntry(
        time: DateTime.now().subtract(Duration(days: 1)),
        value: 12,
      ),
      TrackingEntry(time: DateTime.now(), value: 14),
    ],
  ),
  DoubleTrackingEntity(
    datatype: .double,
    title: "Test stat 3",
    values: [
      TrackingEntry(
        time: DateTime.now().subtract(Duration(days: 2)),
        value: 10,
      ),
      TrackingEntry(
        time: DateTime.now().subtract(Duration(days: 1)),
        value: 12,
      ),
      TrackingEntry(time: DateTime.now(), value: 14),
    ],
  ),
];

final DateFormat formatter = DateFormat.yMd();

List<Map<String, dynamic>> map(List<TrackingEntry> list) {
  final List<Map<String, dynamic>> result = [];

  for (var item in list) {
    Map<String, dynamic> value = {
      'date': formatter.format(item.time),
      'value': item.value,
    };
    result.add(value);
  }

  return result;
}

void main() {
  runApp(const MainApp());
}
