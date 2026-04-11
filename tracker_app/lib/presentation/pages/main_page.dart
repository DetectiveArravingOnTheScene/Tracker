import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tracker_app/domain/entities/tracking_entity.dart';
import 'package:tracker_app/domain/entities/tracking_entry.dart';
import 'package:tracker_app/domain/service/tracking_service.dart';
import 'package:tracker_app/presentation/widgets/tracking_card.dart';

final Random random = Random();

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TrackingService>(
      builder: (context, service, _) {
        return Scaffold(
          appBar: AppBar(title: Text("Main Page")),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              final id = await service.upsertEntity(
                TrackingEntity(
                  id: null,
                  title: 'test',
                  datatype: TrackingDatatype.double,
                  values: [],
                ),
              );

              for (int i = 0; i < 10; i++) {
                service.addEntry(
                  TrackingEntry<double>(
                    id: null,
                    time: DateTime.now().add(
                      Duration(seconds: random.nextInt(5)),
                    ),
                    entityId: id,
                    value: random.nextDouble() * 25,
                  ),
                );
              }
            },
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
              itemCount: service.data.length,
              separatorBuilder: (context, index) {
                return SizedBox(height: 16);
              },
              itemBuilder: (context, index) {
                return TrackingCard(entity: service.data[index]);
              },
            ),
          ),
        );
      },
    );
  }
}
