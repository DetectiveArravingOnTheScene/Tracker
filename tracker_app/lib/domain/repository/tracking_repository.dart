import 'package:tracker_app/domain/entities/tracking_entry.dart';
import 'package:tracker_app/domain/entities/trackitng_entity.dart';

abstract class TrackingRepository {
  Future<List<TrackingEntity>> loadData();

  Future<void> upsertEntity(TrackingEntity entity);

  Future<void> deleteEntity(TrackingEntity entity);

  Future<void> addEntry(TrackingEntry entry);

  Future<void> deleteEntry(TrackingEntry entry);
}
