import 'package:tracker_app/data/data_sources/drift_local_data_source/local_data_source_impl.dart';
import 'package:tracker_app/domain/entities/trackitng_entity.dart';

class TrackingRepository {
  final LocalDataSourceImpl _db = LocalDataSourceImpl();
  Future<List<TrackingEntity>> loadEntities() async {
    final rows = await _db.loadEntities();
  }
}
