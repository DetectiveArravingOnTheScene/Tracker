import 'package:flutter/material.dart';
import 'package:tracker_app/domain/entities/trackitng_entity.dart';

class TrackingService extends ChangeNotifier {
  List<TrackingEntity>? _data;
  List<TrackingEntity>? get data => _data;

  Future<void> load() {}

  Future<void> addEntry() {}

  Future<void> deleteEntry() {}

  Future<void> addTrackingEntity() {}

  Future<void> updateTrackingEntity() {}

  Future<void> deleteTrackingEntity() {}
}
