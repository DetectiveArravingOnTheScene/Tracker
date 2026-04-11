import 'package:drift/drift.dart';
import 'package:tracker_app/data/data_sources/drift_local_data_source/local_data_source_impl.dart';
import 'package:tracker_app/domain/entities/tracking_entry.dart';
import 'package:tracker_app/domain/entities/tracking_entity.dart';

abstract class TrackingEntityMapper {
  static TrackingEntity toEntity(
    TrackingEntitiesTableData model, {
    List<TrackingEntry>? values,
  }) {
    switch (model.datatype) {
      case TrackingDatatype.double:
        return TrackingEntity<double>(
          id: model.id,
          datatype: model.datatype,
          title: model.title,
          values: values?.whereType<TrackingEntry<double>>().toList() ?? [],
        );
      case TrackingDatatype.int:
        return TrackingEntity<int>(
          id: model.id,
          datatype: model.datatype,
          title: model.title,
          values: values?.whereType<TrackingEntry<int>>().toList() ?? [],
        );
    }
  }

  static TrackingEntitiesTableCompanion toModel(TrackingEntity entity) {
    return TrackingEntitiesTableCompanion(
      datatype: Value(entity.datatype),
      id: entity.id == null ? const Value.absent() : Value(entity.id!),
      title: Value(entity.title),
    );
  }
}
