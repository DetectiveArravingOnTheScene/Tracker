import 'package:drift/drift.dart';
import 'package:tracker_app/data/data_sources/drift_local_data_source/local_data_source_impl.dart';
import 'package:tracker_app/domain/entities/tracking_entry.dart';
import 'package:tracker_app/domain/entities/trackitng_entity.dart';

abstract class TrackingEntityMapper {
  static TrackingEntity toEntity(
    TrackingEntitiesTableData model, {
    List<TrackingEntry>? values,
  }) {
    switch (model.datatype) {
      case TrackingDatatype.double:
        return DoubleTrackingEntity(
          id: model.id,
          datatype: model.datatype,
          title: model.title,
          values: values as List<TrackingEntry<double>>? ?? [],
        );
      case TrackingDatatype.time:
        return TimeTrackingEntity(
          id: model.id,
          datatype: model.datatype,
          title: model.title,
          values: values as List<TrackingEntry<DateTime>>? ?? [],
        );
      case TrackingDatatype.int:
        return IntTrackingEntity(
          id: model.id,
          datatype: model.datatype,
          title: model.title,
          values: values as List<TrackingEntry<int>>? ?? [],
        );
    }
  }

  static TrackingEntitiesTableCompanion toModel(TrackingEntity entity) {
    return TrackingEntitiesTableCompanion(
      datatype: Value(entity.datatype),
      id: Value(entity.id),
      title: Value(entity.title),
    );
  }
}
