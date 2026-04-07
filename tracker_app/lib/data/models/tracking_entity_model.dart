import 'package:tracker_app/data/data_sources/drift_local_data_source/local_data_source_impl.dart';
import 'package:tracker_app/data/models/tracking_entry_model.dart';
import 'package:tracker_app/domain/entities/trackitng_entity.dart';

sealed class TrackingEntityModel<T> {
  final int id;
  final TrackingDatatype type;
  final String title;
  final List<TrackingEntryModel<T>> values;

  const TrackingEntityModel({
    required this.id,
    required this.title,
    required this.type,
    required this.values,
  });
}

final class DoubleTrackingEntityModel extends TrackingEntityModel<double> {
  const DoubleTrackingEntityModel({
    required super.id,
    required super.title,
    required super.type,
    required super.values,
  });
}

final class IntTrackingEntityModel extends TrackingEntityModel<int> {
  const IntTrackingEntityModel({
    required super.id,
    required super.title,
    required super.type,
    required super.values,
  });
}

final class DateTimeTrackingEntityModel extends TrackingEntityModel<DateTime> {
  const DateTimeTrackingEntityModel({
    required super.id,
    required super.title,
    required super.type,
    required super.values,
  });
}
