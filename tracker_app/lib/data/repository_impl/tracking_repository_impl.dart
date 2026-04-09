import 'package:tracker_app/domain/entities/tracking_entry.dart';
import 'package:tracker_app/domain/entities/trackitng_entity.dart';
import 'package:tracker_app/domain/repository/tracking_repository.dart';

class TrackingRepositoryImpl implements TrackingRepository {
  @override
  Future<List<TrackingEntity>> loadData() {
    // TODO: implement loadData
    throw UnimplementedError();
  }

  @override
  Future<void> upsertEntity(TrackingEntity entity) {
    // TODO: implement upsertEntity
    throw UnimplementedError();
  }

  @override
  Future<void> deleteEntity(TrackingEntity entity) {
    // TODO: implement deleteEntity
    throw UnimplementedError();
  }

  @override
  Future<void> addEntry(TrackingEntry entry) {
    // TODO: implement addEntry
    throw UnimplementedError();
  }

  @override
  Future<void> deleteEntry(TrackingEntry entry) {
    // TODO: implement deleteEntry
    throw UnimplementedError();
  }
}
