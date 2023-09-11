import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class KiteController extends GetxController {
  final resultStr = "No calculated value".obs;

  final diagonalController1 = TextEditingController();
  final diagonalController2 = TextEditingController();

  calculateArea() {
    double? diagonalLine1 = double.tryParse(diagonalController1.text);
    double? diagonalLine2 = double.tryParse(diagonalController2.text);

    if (diagonalLine1 == null || diagonalLine2 == null) {
      resultStr.value = "Only valid numbers are allowed";
    } else {
      double result = (diagonalLine1 * diagonalLine2) / 2;
      resultStr.value = "Calculated value: $result";
    }
  }

  reset() {
    resultStr.value = "No calculated valued";
    diagonalController1.text = "";
    diagonalController2.text = "";
  }
}
