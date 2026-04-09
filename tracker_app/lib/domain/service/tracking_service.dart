import 'package:flutter/material.dart';
import 'package:tracker_app/domain/entities/trackitng_entity.dart';

class TrackingService extends ChangeNotifier {
  List<TrackingEntity>? _data;
  List<TrackingEntity>? get data => _data;
}
