import 'package:tracker_app/domain/entities/tracking_entry.dart';
import 'package:tracker_app/domain/entities/tracking_entity.dart';

abstract class TrackingRepository {
  Future<List<TrackingEntity>> loadData();

  Future<int> upsertEntity(TrackingEntity entity);

  Future<void> deleteEntity(TrackingEntity entity);

  Future<int> addEntry(TrackingEntry entry);

  Future<void> deleteEntry(TrackingEntry entry);
}
