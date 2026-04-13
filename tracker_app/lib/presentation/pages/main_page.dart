import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tracker_app/domain/entities/tracking_entity.dart';
import 'package:tracker_app/domain/service/tracking_service.dart';
import 'package:tracker_app/presentation/pages/add_entity_dialog.dart';
import 'package:tracker_app/presentation/theme/theme_context_extension.dart';
import 'package:tracker_app/presentation/widgets/page_base.dart';
import 'package:tracker_app/presentation/widgets/tracking_card.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TrackingService>(
      builder: (context, service, _) {
        return PageBase(
          title: "Main page",
          floatingActionButton: Builder(
            builder: (context) {
              return FloatingActionButton(
                backgroundColor: context.colorScheme.primary,
                child: Icon(
                  Icons.add,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                onPressed: () async {
                  final createdEntity = await showDialog<TrackingEntity>(
                    context: context,
                    builder: (_) => AddEntityDialog(),
                  );

                  if (createdEntity != null) {
                    service.upsertEntity(createdEntity);
                  }
                },
              );
            },
          ),
          child: ListView.separated(
            itemCount: service.data.length,
            separatorBuilder: (context, index) {
              return SizedBox(height: 16);
            },
            itemBuilder: (context, index) {
              return TrackingCard(entity: service.data[index]);
            },
          ),
        );
      },
    );
  }
}
