import 'package:lab_2/lab_2.dart';

void main(List<String> arguments) {
  logTest();
  double x = -0.2;
  MainFun mainFun = MainFun();
  TestFun testFun = TestFun();

  print("функция по ряду тейлора: ${mainFun.calculateMainFun(x)}");

  print("функция по Math: ${testFun.calculateMainFun(x)}");
}
