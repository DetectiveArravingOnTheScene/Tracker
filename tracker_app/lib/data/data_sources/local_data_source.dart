import 'package:tracker_app/data/data_sources/drift_local_data_source/local_data_source_impl.dart';
import 'package:tracker_app/data/models/tracking_entity_with_entries_model.dart';

abstract class LocalDataSource {
  Stream<List<TrackingEntityWithEntriesModel>> watchData();
  Future<List<TrackingEntitiesTableData>> loadEntities();
  Future<int> upsertTrackingEntity(TrackingEntitiesTableCompanion model);
  Future<void> deleteTrackingEntity(TrackingEntitiesTableCompanion model);

  Future<List<TrackingEntriesTableData>> loadEntries();
  Future<int> addEntry(TrackingEntriesTableCompanion model);
  Future<int> deleteEntry(TrackingEntriesTableCompanion model);
}
