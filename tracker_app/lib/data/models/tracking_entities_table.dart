import 'package:drift/drift.dart';
import 'package:tracker_app/data/models/tracking_datatype_converter.dart';

class TrackingEntitiesTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  IntColumn get datatype => integer().map(const TrackingDatatypeConverter())();
}
