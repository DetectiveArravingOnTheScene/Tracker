import 'package:drift/drift.dart';
import 'package:tracker_app/data/data_sources/drift_local_data_source/local_data_source_impl.dart';
import 'package:tracker_app/domain/entities/tracking_entry.dart';

abstract class TrackingEntryMapper {
  static TrackingEntry toEntity(TrackingEntriesTableData model) {
    if (model.doubleValue != null) {
      return TrackingEntry(
        id: model.id,
        time: model.time,
        value: model.doubleValue!,
      );
    }

    if (model.intValue != null) {
      return TrackingEntry(
        id: model.id,
        time: model.time,
        value: model.intValue!,
      );
    }

    if (model.timeValue != null) {
      return TrackingEntry(
        id: model.id,
        time: model.time,
        value: model.timeValue!,
      );
    }

    throw Exception();
  }

  static TrackingEntriesTableCompanion toModel(TrackingEntry entity) {
    final model = TrackingEntriesTableCompanion(
      id: Value(entity.id),
      time: Value(entity.time),
    );
    final value = entity.value;

    if (value is double) {
      return model.copyWith(doubleValue: Value(value));
    }
    if (value is int) {
      return model.copyWith(intValue: Value(value));
    }

    if (value is DateTime) {
      return model.copyWith(timeValue: Value(value));
    }

    throw Exception();
  }
}
