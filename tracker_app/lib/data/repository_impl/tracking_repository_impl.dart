import 'package:tracker_app/data/data_sources/local_data_source.dart';
import 'package:tracker_app/data/mappers/tracking_entity_mapper.dart';
import 'package:tracker_app/data/mappers/tracking_entry_mapper.dart';
import 'package:tracker_app/domain/entities/tracking_entry.dart';
import 'package:tracker_app/domain/entities/tracking_entity.dart';
import 'package:tracker_app/domain/repository/tracking_repository.dart';

class TrackingRepositoryImpl implements TrackingRepository {
  final LocalDataSource _localDataSource;

  const TrackingRepositoryImpl(this._localDataSource);

  @override
  Future<List<TrackingEntity>> loadData() async {
    final entities = await _localDataSource.loadEntities();
    final entries = await _localDataSource.loadEntries();

    final Map<int, TrackingDatatype> entityTypes = {
      for (var e in entities) e.id: e.datatype,
    };

    final Map<int, List<TrackingEntry>> map = {};

    for (var item in entries) {
      final type = entityTypes[item.entityId];

      if (type != null) {
        map
            .putIfAbsent(item.entityId, () => [])
            .add(TrackingEntryMapper.toEntity(item, type));
      }
    }

    return entities
        .map((e) => TrackingEntityMapper.toEntity(e, values: map[e.id]))
        .toList();
  }

  @override
  Future<int> upsertEntity(TrackingEntity entity) async {
    return await _localDataSource.upsertTrackingEntity(
      TrackingEntityMapper.toModel(entity),
    );
  }

  @override
  Future<void> deleteEntity(TrackingEntity entity) async {
    await _localDataSource.deleteTrackingEntity(
      TrackingEntityMapper.toModel(entity),
    );
  }

  @override
  Future<int> addEntry(TrackingEntry entry) async {
    return await _localDataSource.addEntry(TrackingEntryMapper.toModel(entry));
  }

  @override
  Future<void> deleteEntry(TrackingEntry entry) async {
    await _localDataSource.deleteEntry(TrackingEntryMapper.toModel(entry));
  }
}
