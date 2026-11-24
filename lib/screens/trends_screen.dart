import 'package:flutter/material.dart';

/// Screen 7: Trends. Built out in issue #10.
class TrendsScreen extends StatelessWidget {
  const TrendsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Trends')),
      body: const Center(child: Text('Trends coming soon')),
    );
  }
}
