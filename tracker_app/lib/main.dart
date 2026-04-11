import 'package:flutter/material.dart';
import 'package:tracker_app/app.dart';
import 'package:tracker_app/data/data_sources/drift_local_data_source/local_data_source_impl.dart';
import 'package:tracker_app/data/repository_impl/tracking_repository_impl.dart';
import 'package:tracker_app/domain/service/tracking_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dataSource = LocalDataSourceImpl();
  final repository = TrackingRepositoryImpl(dataSource);
  final service = TrackingService(repository: repository);

  await service.init();

  runApp(MainApp(service: service));
}
