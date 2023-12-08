import 'package:lab_2/domain/utils.dart';
import 'package:test/test.dart';
import 'dart:math' as math;

void main() {
  group('Проверяем статичные методы абстрактоного класса Utils\n', () {
    late List<double> list;
    setUp(() {
      list = [11.5, 1, 1.3];
    });
    group('тестируем', () {
      test('косинус', () {
        for (var x in list) {
          double resMath = math.cos(x);
          double resUtils = Utils.calculateCos(x, 30);
          expect((resMath - resUtils).abs() < 0.0001, true);
        }
      });
      test('синус', () {
        for (var x in list) {
          double resMath = math.sin(x);
          double resUtils = Utils.calculateSin(x, 30);
          expect((resMath - resUtils).abs() < 0.00001, true);
        }
      });
      test('натуральный логариф', () {
        for (var x in list) {
          double resMath = math.log(x);
          double resUtils = Utils.calculateLn1(x, 30);
          expect((resMath - resUtils).abs() < 0.00001, true);
        }
      });
    });
  });
}
