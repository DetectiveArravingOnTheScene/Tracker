import 'package:drift/drift.dart';
import 'package:tracker_app/data/data_sources/drift_local_data_source/tracking_datatype_converter.dart';

class TrackingEntitiesTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  IntColumn get datatype => integer().map(const TrackingDatatypeConverter())();
}
