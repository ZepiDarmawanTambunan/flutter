import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn/controllers/counter_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final counterC = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => MaterialApp(
        theme: counterC.isDark.value ? ThemeData.dark() : ThemeData.light(),
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final counterC = Get.find<CounterController>();
  // final counterC = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Obx(
          () => Text(
            "Angka ${counterC.counter}",
            style: const TextStyle(
              fontSize: 32,
            ),
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => counterC.increment(),
            child: const Text("+"),
          ),
          FloatingActionButton(
            onPressed: () => counterC.decrement(),
            child: const Text("-"),
          ),
          FloatingActionButton(
            onPressed: () => counterC.changeTime(),
            child: const Text("Theme"),
          ),
        ],
      ),
    );
  }
}
