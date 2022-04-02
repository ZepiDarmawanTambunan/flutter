import 'package:get/get.dart';

class CounterController extends GetxController {
  var counter = 0.obs;
  var isDark = false.obs;

  void changeTime() => isDark.value = !isDark.value;
  void increment() => counter++;
  void decrement() => counter--;
}
