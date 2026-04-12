import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tracker_app/domain/service/tracking_service.dart';
import 'package:tracker_app/presentation/pages/add_entity_dialog.dart';
import 'package:tracker_app/presentation/widgets/page_base.dart';
import 'package:tracker_app/presentation/widgets/tracking_card.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TrackingService>(
      builder: (context, service, _) {
        return PageBase(
          title: "Main page",
          floatingActionButton: FloatingActionButton(
            child: Icon(
              Icons.add,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AddEntityDialog(),
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
