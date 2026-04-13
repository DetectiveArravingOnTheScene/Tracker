import 'package:flutter/material.dart';
import 'package:tracker_app/domain/entities/tracking_entity.dart';
import 'package:tracker_app/presentation/widgets/modal_page_base.dart';

class AddEntityDialog extends StatefulWidget {
  const AddEntityDialog({super.key});

  @override
  State<AddEntityDialog> createState() => _AddEntityDialogState();
}

class _AddEntityDialogState extends State<AddEntityDialog> {
  final TextEditingController _titleController = TextEditingController();
  TrackingDatatype selectedType = TrackingDatatype.double;

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ModalPageBase(
      title: "Create new Entity",
      child: Column(
        children: [
          SizedBox(height: 24),
          TextField(
            controller: _titleController,
            decoration: InputDecoration(
              label: Text("Title"),
              border: OutlineInputBorder(),
              isDense: false,
            ),
          ),
          SizedBox(height: 16),

          DropdownMenu<TrackingDatatype>(
            label: Text("Type"),
            menuStyle: MenuStyle(
              padding: WidgetStatePropertyAll(
                EdgeInsets.symmetric(horizontal: 8),
              ),
            ),
            initialSelection: selectedType,
            width: double.infinity,
            onSelected: (value) => setState(() => selectedType = value!),
            dropdownMenuEntries: [
              DropdownMenuEntry(
                value: TrackingDatatype.double,
                label: 'Double',
              ),
              DropdownMenuEntry(value: TrackingDatatype.int, label: 'Integer'),
            ],
          ),

          SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel"),
              ),
              SizedBox(width: 24),
              FilledButton(
                onPressed: () {
                  Navigator.pop(
                    context,
                    TrackingEntity(
                      id: null,
                      datatype: selectedType,
                      title: _titleController.text,
                    ),
                  );
                },
                child: Text("Save"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
