import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screens/entry_editor_screen.dart';
import 'screens/home_screen.dart';
import 'screens/journal_screen.dart';
import 'screens/mood_check_in_screen.dart';
import 'screens/reminders_screen.dart';
import 'screens/resources_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/sign_in_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/trends_screen.dart';

/// Listens to auth changes so the router re runs its redirect.
class _AuthRefresh extends ChangeNotifier {
  _AuthRefresh() {
    FirebaseAuth.instance.authStateChanges().listen((_) => notifyListeners());
  }
}

final appRouter = GoRouter(
  initialLocation: '/splash',
  refreshListenable: _AuthRefresh(),
  redirect: (context, state) {
    final signedIn = FirebaseAuth.instance.currentUser != null;
    final loc = state.matchedLocation;
    if (loc == '/splash') return null;
    if (!signedIn && loc != '/sign-in') return '/sign-in';
    if (signedIn && loc == '/sign-in') return '/home';
    return null;
  },
  routes: [
    GoRoute(path: '/splash', builder: (_, __) => const SplashScreen()),
    GoRoute(path: '/sign-in', builder: (_, __) => const SignInScreen()),
    GoRoute(path: '/mood', builder: (_, __) => const MoodCheckInScreen()),
    GoRoute(
      path: '/entry/:id',
      builder: (_, s) => EntryEditorScreen(entryId: s.pathParameters['id']!),
    ),
    GoRoute(path: '/reminders', builder: (_, __) => const RemindersScreen()),
    StatefulShellRoute.indexedStack(
      builder: (context, state, shell) => _NavShell(shell: shell),
      branches: [
        StatefulShellBranch(routes: [GoRoute(path: '/home', builder: (_, __) => const HomeScreen())]),
        StatefulShellBranch(routes: [GoRoute(path: '/journal', builder: (_, __) => const JournalScreen())]),
        StatefulShellBranch(routes: [GoRoute(path: '/trends', builder: (_, __) => const TrendsScreen())]),
        StatefulShellBranch(routes: [GoRoute(path: '/resources', builder: (_, __) => const ResourcesScreen())]),
        StatefulShellBranch(routes: [GoRoute(path: '/settings', builder: (_, __) => const SettingsScreen())]),
      ],
    ),
  ],
);

class _NavShell extends StatelessWidget {
  const _NavShell({required this.shell});
  final StatefulNavigationShell shell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: shell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: shell.currentIndex,
        onDestinationSelected: (i) => shell.goBranch(i, initialLocation: i == shell.currentIndex),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.book_outlined), label: 'Journal'),
          NavigationDestination(icon: Icon(Icons.show_chart), label: 'Trends'),
          NavigationDestination(icon: Icon(Icons.spa_outlined), label: 'Resources'),
          NavigationDestination(icon: Icon(Icons.settings_outlined), label: 'Settings'),
        ],
      ),
    );
  }
}
