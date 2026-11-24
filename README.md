# Mental Zen

A private, secure mental wellness journal built with Flutter and Firebase for the GSU Mobile App Development final project.

Users log one mood check in per day, write private journal entries, view mood trends, browse wellness resources and set reminders. A bounded Featured AI Logic module suggests a reflective writing prompt from recent mood patterns, with a fixed prompt baseline and a safe fallback.

> Mental Zen is a self reflection tool, not a medical or diagnostic service. If you are in crisis, call or text 988.

## Setup

1. Install Flutter (stable) and the Firebase CLI, then run `dart pub global activate flutterfire_cli`.
2. Clone this repo and generate the platform folders:
   ```
   flutter create . --org edu.gsu.mentalzen --platforms android,ios
   ```
3. Connect Firebase (creates `lib/firebase_options.dart`, which is git ignored):
   ```
   firebase login
   flutterfire configure --project mental-zen-baa3f
   ```
4. Install packages and run:
   ```
   flutter pub get
   flutter run
   ```
5. Deploy rules: `firebase use mental-zen-baa3f && firebase deploy --only firestore:rules,firestore:indexes` (Storage rules need the Blaze plan)

## Tests

```
flutter test
```

## Project tracking

Work is tracked in GitHub Issues (#1 to #19). Commits reference their issue number.

## AI usage

See [AI_Usage_Log.md](AI_Usage_Log.md).
