import 'dart:math' as math;

abstract class Utils {
  static double calculateCos(double x, int iterations) {
    if (iterations > 30) throw Exception('Слишком много иттераций');
    double result = 0;
    for (int i = 0; i < iterations; i++) {
      double term = (pow(-1, i) * pow(x, 2 * i)) / _factorial(2 * i);
      result += term;
    }
    return result;
  }

  static double calculateSin(double x, int iterations) {
    if (iterations > 30) throw Exception('Слишком много иттераций');
    //if (x > 2) x %=;
    double result = 0;
    for (int i = 0; i < iterations; i++) {
      double term = (pow(-1, i) * pow(x, 2 * i + 1)) / _factorial(2 * i + 1);
      result += term;
    }
    return result;
  }

  static double calculateLn1(double x, int lenght) {
    double result = 0.0;
    for (int n = 1; n <= lenght; n++) {
      result += pow(-1, n + 1) * (pow(x - 1, n) / n);
    }
    return result;
  }

  static double calculateLn2(double x, int iterations) {
    double result = 0.0;
    double numerator = x - 1;
    double denominator = 1.0;

    for (int i = 1; i <= iterations; i++) {
      // Вычисляем текущий член ряда Тейлора и добавляем его к результату
      result += (numerator / denominator) * pow(-1, i + 1);
      numerator *= (x - 1);
      denominator *= i + 1;
    }

    return result;
  }

  static double calculateLn3(double x, int iterations) {
    if (x <= 0) {
      throw ArgumentError('Аргумент x должен быть положительным числом');
    }
    if (x == 1) {
      return 0;
    }
    double result = 0;
    for (int i = 1; i <= iterations; i++) {
      double term = math.pow((x - 1), i) / (i);
      if (i % 2 == 0) {
        result -= term;
      } else {
        result += term;
      }
    }
    return result;
  }

  static int _factorial(int n) {
    int result = 1;
    for (int i = 2; i <= n; i++) {
      result *= i;
    }
    return result;
  }

  static double pow(double x, int exponent) {
    if (exponent == 0) {
      return 1;
    }

    double result = x;

    for (int i = 1; i < exponent.abs(); i++) {
      result *= x;
    }

    if (exponent < 0) {
      return 1 / result;
    }
    return result;
  }

  // static double calculateLn(double input) {
  //   double sum = 0;
  //   double x = input-
  //   for (int i = 1; i < 30; i += 2) {
  //     sum += pow(x, i);
  //   }
  //   return (sum * 2);
  // }
}
