import 'package:lab_2/domain/utils.dart';
import 'package:lab_2/lab_2.dart';
import 'package:test/test.dart';
import 'dart:math' as math;

void main() {
  group('Проверяем главную функцию при ', () {
    double x = 0.5;
    double res = 0;
    double res2 = 0;

    double math_test = 0;
    test('х>0\n', () {
      res = 1 - Utils.calculateCos(x, 30);
      res = res / Utils.calculateSin(x, 30);
      res2 = MainFun().calculateMainFun(x);
      math_test = 1 - math.cos(x);
      math_test = math_test / math.sin(x);
      expect((res - math_test).abs() < 0.01, true, reason: "ewq");
      expect((res2 - math_test).abs() < 0.01, true);
      expect((res - res2).abs() < 0.01, true);
    });
    test('х<0', () {
      x = -0.2;

      res = Utils.calculateSin(x, 30);
      math_test = math.sin(x);
      expect((res - math_test).abs() < 0.01, true,
          reason: "calculateSin not pased");
      final lnX = Utils.calculateLn1(x.abs(), 30);
      final lnX2 = math.log(x.abs());
      expect((lnX - lnX2).abs() < 0.01, true, reason: "calculateLn1 not pased");

      res *= Utils.calculateCos(lnX, 30);
      math_test *= math.cos(lnX2);
      expect((res - math_test).abs() < 0.01, true,
          reason: "calculateCos not pased");

      res = math.sqrt(res);
      math_test = math.sqrt(math_test);
      expect((res - math_test).abs() < 0.01, true,
          reason: "integration_test not pased");

      res2 = MainFun().calculateMainFun(x);

      expect((res2 - math_test).abs() < 0.01, true);
      expect((res - res2).abs() < 0.01, true);
    });
  });
}
