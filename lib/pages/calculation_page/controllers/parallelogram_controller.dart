import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ParallelogramController extends GetxController {
  final resultStr = "No calculated value".obs;

  final alasController = TextEditingController();
  final tinggiController = TextEditingController();

  calculateArea() {
    double? alas = double.tryParse(alasController.text);
    double? tinggi = double.tryParse(tinggiController.text);

    if (alas == null || tinggi == null) {
      resultStr.value = "No calculated value";
    } else {
      double result = alas * tinggi;
      resultStr.value = "Calculated value: $result";
    }
  }

  reset() {
    resultStr.value = "No calculated value";
    alasController.text = "";
    tinggiController.text = "";
  }
}
