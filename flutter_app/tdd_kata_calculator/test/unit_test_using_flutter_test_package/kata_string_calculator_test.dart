import 'package:flutter_test/flutter_test.dart';
// change to your actual package or relative path
import 'package:tdd_kata_calculator/kata_string_calculator.dart';

void main() {
  group('StringCalculator.add()', () {
    final calculator = StringCalculator();

    test('returns 3 for "1,2"', () {
      expect(calculator.add('1,2'), equals(3));
    });

    test('returns 0 for empty string', () {
      expect(calculator.add(''), equals(0));
    });

    test('returns 1 for "1"', () {
      expect(calculator.add('1'), equals(1));
    });

    test('returns 6 for "1,2,3"', () {
      expect(calculator.add('1,2,3'), equals(6));
    });

    test('returns 100 for "10,20,30,40"', () {
      expect(calculator.add('10,20,30,40'), equals(100));
    });

    test('handles newlines and commas: "100\\n200\\n300,10" → 610', () {
      expect(calculator.add('100\n200\n300,10'), equals(610));
    });

    test('handles multiple newlines: "10\\n20\\n30\\n40" → 100', () {
      expect(calculator.add('10\n20\n30\n40'), equals(100));
    });

    test('handles custom single‐char delimiter: "//*\\n10*20*30,40" → 100', () {
      expect(calculator.add('//*\n10*20*30,40'), equals(100));
    });

    test('throws on negatives', () {
      expect(
        () => calculator.add('//;\n10;20;30,-40'),
        throwsA(isA<ArgumentError>()),
      );
    });
  });
}