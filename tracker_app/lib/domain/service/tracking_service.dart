import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tracker_app/domain/entities/tracking_entity.dart';
import 'package:tracker_app/domain/entities/tracking_entry.dart';
import 'package:tracker_app/domain/repository/tracking_repository.dart';

class TrackingService extends ChangeNotifier {
  final TrackingRepository _repository;
  StreamSubscription? _subscription;

  TrackingService({required TrackingRepository repository})
    : _repository = repository;

  List<TrackingEntity> _data = [];
  List<TrackingEntity> get data => _data;

  Future<void> init() async {
    final completer = Completer<void>();

    _subscription = _repository.watchData().listen((newData) {
      _data = newData;
      notifyListeners();

      if (!completer.isCompleted) {
        completer.complete();
      }
    });

    return completer.future;
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  Future<int> upsertEntity(TrackingEntity entity) async {
    return await _repository.upsertEntity(entity);
  }

  Future<int> addEntry(TrackingEntry entry) async {
    return await _repository.addEntry(entry);
  }

  Future<void> deleteEntity(TrackingEntity entity) async {
    return await _repository.deleteEntity(entity);
  }

  Future<void> deleteEntry(TrackingEntry entry) async {
    return await _repository.deleteEntry(entry);
  }
}
