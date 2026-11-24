import 'package:flutter/material.dart';

/// App theme. The winter variant is switched on later through Remote Config (#16).
class AppTheme {
  static const _seed = Color(0xFF1F4D36);

  static ThemeData light({bool winter = false}) {
    final scheme = ColorScheme.fromSeed(
      seedColor: winter ? const Color(0xFF2F5D8A) : _seed,
    );
    return ThemeData(
      colorScheme: scheme,
      useMaterial3: true,
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(minimumSize: const Size.fromHeight(52)),
      ),
    );
  }
}
