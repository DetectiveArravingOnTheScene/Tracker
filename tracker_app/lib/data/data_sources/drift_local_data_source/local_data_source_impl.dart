import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:tracker_app/data/data_sources/drift_local_data_source/tracking_datatype_converter.dart';
import 'package:tracker_app/data/data_sources/drift_local_data_source/tracking_entities_table.dart';
import 'package:tracker_app/data/data_sources/drift_local_data_source/tracking_entries_table.dart';
import 'package:tracker_app/data/models/tracking_entity_model.dart';
import 'package:tracker_app/data/models/tracking_entry_model.dart';
import 'package:tracker_app/domain/entities/trackitng_entity.dart';

part 'local_data_source_impl.g.dart';

@DriftDatabase(tables: [TrackingEntriesTable, TrackingEntitiesTable])
class LocalDataSourceImpl extends _$LocalDataSourceImpl {
  LocalDataSourceImpl([QueryExecutor? executor]) : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static LazyDatabase _openConnection() {
    return LazyDatabase(() async {
      final dir = await getApplicationDocumentsDirectory();
      final path = p.join(dir.path, 'tracker.db');
      return NativeDatabase.createInBackground(File(path));
    });
  }

  Future<List<TrackingEntityModel>> loadEntities() async {
    final allEntities = await select(trackingEntitiesTable).get();
    final allEntries = await select(trackingEntriesTable).get();

    final Map<int, List<TrackingEntriesTableData>> entriesByEntityId = {};
    for (final entry in allEntries) {
      entriesByEntityId.putIfAbsent(entry.entityId, () => []).add(entry);
    }

    final List<TrackingEntityModel> result = [];

    for (final entityRow in allEntities) {
      final matchedEntryRows = entriesByEntityId[entityRow.id] ?? [];

      switch (entityRow.datatype) {
        case TrackingDatatype.int:
          final List<TrackingEntryModel<int>> entryModels = map<int>(
            matchedEntryRows,
            (data) => data.intValue,
          );

          result.add(
            IntTrackingEntityModel(
              id: entityRow.id,
              title: entityRow.title,
              type: entityRow.datatype,
              values: entryModels,
            ),
          );
          break;

        case TrackingDatatype.double:
          final List<TrackingEntryModel<double>> entryModels = map<double>(
            matchedEntryRows,
            (data) => data.doubleValue,
          );

          result.add(
            DoubleTrackingEntityModel(
              id: entityRow.id,
              title: entityRow.title,
              type: entityRow.datatype,
              values: entryModels,
            ),
          );
          break;

        case TrackingDatatype.time:
          final List<TrackingEntryModel<DateTime>> entryModels = map<DateTime>(
            matchedEntryRows,
            (data) => data.timeValue,
          );

          result.add(
            DateTimeTrackingEntityModel(
              id: entityRow.id,
              title: entityRow.title,
              type: entityRow.datatype,
              values: entryModels,
            ),
          );
          break;
      }
    }

    return result;
  }

  List<TrackingEntryModel<T>> map<T>(
    Iterable<TrackingEntriesTableData> matchedEntryRows,
    T? Function(TrackingEntriesTableData data) getValue,
  ) {
    final List<TrackingEntryModel<T>> entryModels = [];

    for (final entryRow in matchedEntryRows) {
      final value = getValue(entryRow);

      if (value != null) {
        entryModels.add(
          TrackingEntryModel<T>(
            id: entryRow.id,
            time: entryRow.time,
            value: value,
          ),
        );
      }
    }

    return entryModels;
  }
}
