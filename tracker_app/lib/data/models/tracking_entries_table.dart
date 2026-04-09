import 'package:drift/drift.dart';
import 'package:tracker_app/data/models/tracking_entities_table.dart';

class TrackingEntriesTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get entityId => integer().references(TrackingEntitiesTable, #id)();
  DateTimeColumn get time => dateTime()();

  RealColumn get doubleValue => real().nullable()();
  IntColumn get intValue => integer().nullable()();
  DateTimeColumn get timeValue => dateTime().nullable()();
}
