import 'dart:developer';
import 'dart:math' as math;

import 'package:lab_2/domain/utils.dart';

abstract class Fun {
  double calculateMainFun(double x) => x > 0
      ? _calculateMainFunWithPositive(x)
      : _calculateMainFunWithNegative(x);
  double _calculateMainFunWithPositive(double x);
  double _calculateMainFunWithNegative(double x);
  Fun();
}

class TestFun extends Fun {
  @override
  double calculateMainFun(double x) => x > 0
      ? _calculateMainFunWithPositive(x)
      : _calculateMainFunWithNegative(x);

  @override
  double _calculateMainFunWithPositive(double x) =>
      (1 - math.cos(x)) / math.sin(x);

  @override
  double _calculateMainFunWithNegative(double x) =>
      math.sqrt(math.sin(x) * math.cos(math.log(x.abs())));
}

class MainFun extends Fun {
  @override
  double calculateMainFun(double x) => x > 0
      ? _calculateMainFunWithPositive(x)
      : _calculateMainFunWithNegative(x);

  @override
  double _calculateMainFunWithPositive(double x) =>
      (1 - Utils.calculateCos(x, 30)) / Utils.calculateSin(x, 30);

  @override
  double _calculateMainFunWithNegative(double x) =>
      math.sqrt(Utils.calculateSin(x, 30) *
          Utils.calculateCos(Utils.calculateLn1(x.abs(), 30), 30));
}

void logTest() {
  double x = 0.5;
  int lenght = 100;
  log(math.cos(0.5).toString(), name: 'Косинус по Math');
  log('${Utils.calculateCos(0.5, 30)}', name: 'Косинус по ряду тейлора');

  log(math.sin(0.5).toString(), name: 'Синус по Math');
  log('${Utils.calculateSin(0.5, 30)}', name: 'Синус по ряду тейлора');

  log(math.log(x).toString(), name: "Логарифм из библеотеки Math");
  log("${Utils.calculateLn1(x, lenght)}",
      name: "Логарифм по ряду тейлора 1 версия");
  log("${Utils.calculateLn2(x, lenght)}",
      name: "Логарифм по ряду тейлора 2 версия");
  log("${Utils.calculateLn3(x, lenght)}",
      name: "Логарифм по ряду тейлора 3 версия");
}
