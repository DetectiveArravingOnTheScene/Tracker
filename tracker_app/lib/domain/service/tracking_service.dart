import 'package:flutter/material.dart';
import 'package:tracker_app/domain/entities/tracking_entity.dart';
import 'package:tracker_app/domain/entities/tracking_entry.dart';
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

  Future<int> upsertEntity(TrackingEntity entity) async {
    final id = await _repository.upsertEntity(entity);
    _data = await _repository.loadData();
    notifyListeners();
    return id;
  }

  Future<int> addEntry(TrackingEntry entry) async {
    final id = await _repository.addEntry(entry);
    _data = await _repository.loadData();
    notifyListeners();
    return id;
  }
}
