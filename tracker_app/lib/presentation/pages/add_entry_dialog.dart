import 'package:flutter/material.dart';
import 'package:tracker_app/domain/entities/tracking_entry.dart';
import 'package:tracker_app/presentation/widgets/modal_page_base.dart';

class AddEntryDialog extends StatefulWidget {
  const AddEntryDialog({super.key});

  @override
  State<AddEntryDialog> createState() => _AddEntryDialogState();
}

class _AddEntryDialogState extends State<AddEntryDialog> {
  final TextEditingController _titleController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ModalPageBase(
      title: "Create new Entry",
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
                  Navigator.pop(context, _titleController.text);
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
