import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tracker_app/domain/entities/tracking_entity.dart';
import 'package:tracker_app/domain/service/tracking_service.dart';

class AddEntityPage extends StatefulWidget {
  const AddEntityPage({super.key});

  @override
  State<AddEntityPage> createState() => _AddEntityPageState();
}

class _AddEntityPageState extends State<AddEntityPage> {
  final TextEditingController _titleController = TextEditingController();

  TrackingDatatype _datatype = TrackingDatatype.int;

  @override
  Widget build(BuildContext context) {
    return Consumer<TrackingService>(
      builder: (context, service, _) {
        return Scaffold(
          appBar: AppBar(title: Text("Add Entity")),
          body: Column(
            children: [
              Text("Title"),
              TextField(controller: _titleController),
              Text("Datatype"),
              DropdownMenu(
                onSelected: (value) {
                  setState(() {
                    if (value == null) return;
                    _datatype = value;
                  });
                },
                dropdownMenuEntries: [
                  DropdownMenuEntry(
                    value: TrackingDatatype.double,
                    label: "Double",
                  ),
                  DropdownMenuEntry(value: TrackingDatatype.int, label: "Int"),
                ],
              ),

              FilledButton(
                onPressed: () {
                  final title = _titleController.text.trim();
                  final type = _datatype;

                  service.upsertEntity(
                    TrackingEntity(id: null, title: title, datatype: type),
                  );
                },
                child: Text("Create"),
              ),
            ],
          ),
        );
      },
    );
  }
}
