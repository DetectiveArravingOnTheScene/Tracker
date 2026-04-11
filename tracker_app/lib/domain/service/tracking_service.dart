import 'package:flutter/material.dart';
import 'package:tracker_app/domain/entities/trackitng_entity.dart';
import 'package:tracker_app/domain/repository/tracking_repository.dart';

class TrackingService extends ChangeNotifier {
  final TrackingRepository _repository;

  TrackingService({required TrackingRepository repository})
    : _repository = repository;

  List<TrackingEntity> _data = [];
  List<TrackingEntity> get data => _data;

  Future<void> init() async {
    _data = await _repository.loadData();
    notifyListeners();
  }

  Future<void> upsertEntity(TrackingEntity entity) async {
    await _repository.upsertEntity(entity);
    _data = await _repository.loadData();
    notifyListeners();
  }
}
