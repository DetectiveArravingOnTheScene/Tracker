import 'package:tracker_app/data/data_sources/drift_local_data_source/local_data_source_impl.dart';

class TrackingEntityWithEntriesModel {
  final TrackingEntitiesTableData entity;
  final List<TrackingEntriesTableData> entries;

  TrackingEntityWithEntriesModel(this.entity, this.entries);
}
