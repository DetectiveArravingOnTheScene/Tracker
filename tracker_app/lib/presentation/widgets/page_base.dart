import 'package:flutter/material.dart';

class PageBase extends StatelessWidget {
  final String title;
  final Widget? floatingActionButton;
  final Widget child;
  const PageBase({
    super.key,
    required this.title,
    required this.child,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      drawer: Drawer(),
      floatingActionButton: floatingActionButton,
      body: Padding(padding: const EdgeInsets.all(8.0), child: child),
    );
  }
}
