import 'package:flutter/material.dart';

/// Screen 4: Mood Check In. Built out in issue #5.
class MoodCheckInScreen extends StatelessWidget {
  const MoodCheckInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mood Check In')),
      body: const Center(child: Text('Mood Check In coming soon')),
    );
  }
}
