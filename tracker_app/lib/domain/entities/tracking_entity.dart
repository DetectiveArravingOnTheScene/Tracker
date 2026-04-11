import 'package:tracker_app/domain/entities/tracking_entry.dart';

final class TrackingEntity<T> {
  final int? id;
  final String title;
  final TrackingDatatype datatype;
  final List<TrackingEntry<T>> values;

  const TrackingEntity({
    required this.id,
    required this.title,
    required this.datatype,
    required this.values,
  });
}

enum TrackingDatatype { double, int }
