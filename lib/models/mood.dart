import 'package:intl/intl.dart';

/// One mood check in per day. The Firestore doc id is the local date key,
/// so a second save on the same day updates instead of duplicating (#5).
class Mood {
  Mood({required this.date, required this.score, this.tags = const [], this.note = ''})
      : assert(score >= 1 && score <= 5, 'score must be 1 to 5');

  final DateTime date;
  final int score;
  final List<String> tags;
  final String note;

  static const labels = {1: 'Awful', 2: 'Low', 3: 'Okay', 4: 'Good', 5: 'Great'};
  static const allowedTags = ['Sleep', 'School', 'Social', 'Work'];

  /// yyyy-MM-dd in the user's local timezone.
  static String dateKey(DateTime d) => DateFormat('yyyy-MM-dd').format(d.toLocal());

  String get id => dateKey(date);

  static bool isValidScore(Object? v) => v is int && v >= 1 && v <= 5;

  Map<String, dynamic> toMap() => {
        'score': score,
        'tags': tags,
        'note': note,
        'date': id,
      };

  factory Mood.fromMap(String id, Map<String, dynamic> m) => Mood(
        date: DateTime.parse(id),
        score: m['score'] as int,
        tags: List<String>.from(m['tags'] ?? const []),
        note: (m['note'] ?? '') as String,
      );
}
