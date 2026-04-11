import 'package:tracker_app/data/data_sources/drift_local_data_source/local_data_source_impl.dart';

abstract class LocalDataSource {
  Future<List<TrackingEntitiesTableData>> loadEntities();
  Future<int> upsertTrackingEntity(TrackingEntitiesTableCompanion model);
  Future<void> deleteTrackingEntity(TrackingEntitiesTableCompanion model);

  Future<List<TrackingEntriesTableData>> loadEntries();
  Future<int> addEntry(TrackingEntriesTableCompanion model);
  Future<int> deleteEntry(TrackingEntriesTableCompanion model);
}
