import 'package:drift/drift.dart';
import 'package:tracker_app/data/data_sources/drift_local_data_source/local_data_source_impl.dart';
import 'package:tracker_app/domain/entities/tracking_entity.dart';
import 'package:tracker_app/domain/entities/tracking_entry.dart';

abstract class TrackingEntryMapper {
  static TrackingEntry toEntity(
    TrackingEntriesTableData model,
    TrackingDatatype type,
  ) {
    return switch (type) {
      TrackingDatatype.double => TrackingEntry<double>(
        id: model.id,
        entityId: model.entityId,
        time: model.time,
        value: double.tryParse(model.value) ?? 0.0,
      ),
      TrackingDatatype.int => TrackingEntry<int>(
        id: model.id,
        entityId: model.entityId,
        time: model.time,
        value: int.tryParse(model.value) ?? 0,
      ),
    };
  }

  static TrackingEntriesTableCompanion toModel(TrackingEntry entity) {
    final model = TrackingEntriesTableCompanion(
      id: entity.id == null ? const Value.absent() : Value(entity.id!),
      entityId: Value(entity.entityId),
      time: Value(entity.time),
    );
    final value = entity.value;

    if (value is double) {
      return model.copyWith(value: Value(value.toString()));
    }
    if (value is int) {
      return model.copyWith(value: Value(value.toString()));
    }

    throw Exception();
  }
}
