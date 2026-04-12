import 'package:flutter/material.dart';

class ModalPageBase extends StatelessWidget {
  final String title;
  final Widget child;
  const ModalPageBase({super.key, required this.child, required this.title});

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close),
                ),
                Text(title),
                Spacer(),
                TextButton(onPressed: () {}, child: const Text("Save")),
              ],
            ),
            child,
          ],
        ),
      ),
    );
  }
}
