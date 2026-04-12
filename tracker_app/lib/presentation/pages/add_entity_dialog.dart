import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tracker_app/domain/entities/tracking_entity.dart';
import 'package:tracker_app/domain/service/tracking_service.dart';
import 'package:tracker_app/presentation/widgets/modal_page_base.dart';
import 'package:tracker_app/presentation/widgets/page_base.dart';

class AddEntityDialog extends StatefulWidget {
  const AddEntityDialog({super.key});

  @override
  State<AddEntityDialog> createState() => _AddEntityDialogState();
}

class _AddEntityDialogState extends State<AddEntityDialog> {
  @override
  Widget build(BuildContext context) {
    return ModalPageBase(
      title: "Create new Entity",
      child: Column(children: [Text("HI")]),
    );
  }
}
