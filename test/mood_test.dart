import 'package:flutter_test/flutter_test.dart';
import 'package:mental_zen/models/mood.dart';

void main() {
  group('Mood.dateKey', () {
    test('formats as yyyy-MM-dd', () {
      expect(Mood.dateKey(DateTime(2026, 11, 4, 23, 59)), '2026-11-04');
    });

    test('same day gives the same key, so one mood per day', () {
      expect(Mood.dateKey(DateTime(2026, 11, 24, 0, 1)),
          Mood.dateKey(DateTime(2026, 11, 24, 23, 59)));
    });
  });

  group('Mood.isValidScore', () {
    test('accepts 1 to 5', () {
      for (var s = 1; s <= 5; s++) {
        expect(Mood.isValidScore(s), isTrue);
      }
    });

    test('rejects out of range and wrong types', () {
      expect(Mood.isValidScore(0), isFalse);
      expect(Mood.isValidScore(6), isFalse);
      expect(Mood.isValidScore('3'), isFalse);
      expect(Mood.isValidScore(null), isFalse);
    });
  });

  test('round trips through a Firestore map', () {
    final m = Mood(date: DateTime(2026, 11, 24), score: 4, tags: ['School'], note: 'ok');
    final back = Mood.fromMap(m.id, m.toMap());
    expect(back.score, 4);
    expect(back.tags, ['School']);
    expect(back.id, '2026-11-24');
  });
}
