import 'package:drift/drift.dart';
import 'package:tracker_app/domain/entities/tracking_entity.dart';

class TrackingDatatypeConverter extends TypeConverter<TrackingDatatype, int> {
  const TrackingDatatypeConverter();
  @override
  TrackingDatatype fromSql(int fromDb) {
    return TrackingDatatype.values[fromDb];
  }

  @override
  int toSql(TrackingDatatype value) {
    return value.index;
  }
}
