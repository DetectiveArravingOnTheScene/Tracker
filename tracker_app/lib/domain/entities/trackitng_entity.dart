import 'package:tracker_app/domain/entities/tracking_entry.dart';

sealed class TrackingEntity<T> {
  final String title;
  final TrackingDatatype datatype;
  final List<TrackingEntry<T>> values;

  const TrackingEntity({
    required this.title,
    required this.datatype,
    required this.values,
  });
}

final class DoubleTrackingEntity extends TrackingEntity<double> {
  const DoubleTrackingEntity({
    required super.datatype,
    required super.title,
    required super.values,
  });
}

final class TimeTrackingEntity extends TrackingEntity<DateTime> {
  const TimeTrackingEntity({
    required super.datatype,
    required super.title,
    required super.values,
  });
}

final class IntTrackingEntity extends TrackingEntity<int> {
  const IntTrackingEntity({
    required super.datatype,
    required super.title,
    required super.values,
  });
}

enum TrackingDatatype { double, time, int }
