import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Screen 3: Home dashboard. Mood card, streak and AI prompt card come in #5 and #13.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: ListTile(
              title: const Text('How are you today?'),
              trailing: FilledButton(
                onPressed: () => context.push('/mood'),
                child: const Text('Log mood'),
              ),
            ),
          ),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            onPressed: () => context.push('/entry/new'),
            icon: const Icon(Icons.edit),
            label: const Text('New entry'),
          ),
        ],
      ),
    );
  }
}
