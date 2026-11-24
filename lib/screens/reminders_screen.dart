import 'package:flutter/material.dart';

/// Screen 9: Reminders. Built out in issue #11.
class RemindersScreen extends StatelessWidget {
  const RemindersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reminders')),
      body: const Center(child: Text('Reminders coming soon')),
    );
  }
}
