import 'package:flutter/material.dart';

/// Screen 6: Entry editor. Built out in issue #7. `entryId` is 'new' for a new entry.
class EntryEditorScreen extends StatelessWidget {
  const EntryEditorScreen({super.key, required this.entryId});
  final String entryId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(entryId == 'new' ? 'New entry' : 'Entry')),
      body: const Center(child: Text('Editor coming soon')),
    );
  }
}
