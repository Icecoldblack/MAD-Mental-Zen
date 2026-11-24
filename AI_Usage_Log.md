# AI Usage Log

Every AI assisted change is recorded here: the tool, what was asked, what was accepted or rejected, and how it was verified.

| Date | Tool | Task / prompt | Accepted | Rejected or changed | How I verified |
|---|---|---|---|---|---|
| 2026-11-24 | Claude | Generate GitHub issues from the proposal and scaffold the initial project (pubspec, navigation shell, screen stubs, auth service, mood model, Firestore and Storage rules) | Project structure, rules draft, mood date key helper and test | | Read through every file; `flutter analyze` and `flutter test` after `flutter create .` |
