import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:tracker_app/data/models/tracking_datatype_converter.dart';
import 'package:tracker_app/data/models/tracking_entities_table.dart';
import 'package:tracker_app/data/models/tracking_entity_with_entries_model.dart';
import 'package:tracker_app/data/models/tracking_entries_table.dart';
import 'package:tracker_app/data/data_sources/local_data_source.dart';
import 'package:tracker_app/domain/entities/tracking_entity.dart';

part 'local_data_source_impl.g.dart';

@DriftDatabase(tables: [TrackingEntriesTable, TrackingEntitiesTable])
class LocalDataSourceImpl extends _$LocalDataSourceImpl
    implements LocalDataSource {
  LocalDataSourceImpl([QueryExecutor? executor]) : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  Stream<List<TrackingEntityWithEntriesModel>> watchData() {
    final query = select(trackingEntitiesTable).join([
      leftOuterJoin(
        trackingEntriesTable,
        trackingEntriesTable.entityId.equalsExp(trackingEntitiesTable.id),
      ),
    ]);

    return query.watch().map((rows) {
      final groupedData = <int, TrackingEntityWithEntriesModel>{};

      for (final row in rows) {
        final entity = row.readTable(trackingEntitiesTable);
        final entry = row.readTableOrNull(trackingEntriesTable);

        if (!groupedData.containsKey(entity.id)) {
          groupedData[entity.id] = TrackingEntityWithEntriesModel(entity, []);
        }

        if (entry != null) {
          groupedData[entity.id]!.entries.add(entry);
        }
      }

      return groupedData.values.toList();
    });
  }

  @override
  Future<List<TrackingEntriesTableData>> loadEntries() async {
    return await select(trackingEntriesTable).get();
  }

  @override
  Future<int> addEntry(TrackingEntriesTableCompanion model) async {
    return await into(trackingEntriesTable).insert(model);
  }

  @override
  Future<int> deleteEntry(TrackingEntriesTableCompanion model) async {
    return await delete(trackingEntriesTable).delete(model);
  }

  @override
  Future<List<TrackingEntitiesTableData>> loadEntities() async {
    return await select(trackingEntitiesTable).get();
  }

  @override
  Future<int> upsertTrackingEntity(TrackingEntitiesTableCompanion model) async {
    return await into(trackingEntitiesTable).insertOnConflictUpdate(model);
  }

  @override
  Future<int> deleteTrackingEntity(TrackingEntitiesTableCompanion model) async {
    return await delete(trackingEntitiesTable).delete(model);
  }

  static LazyDatabase _openConnection() {
    return LazyDatabase(() async {
      final dir = await getApplicationDocumentsDirectory();
      final path = p.join(dir.path, 'tracker.db');
      return NativeDatabase.memory();
    });
  }
}
