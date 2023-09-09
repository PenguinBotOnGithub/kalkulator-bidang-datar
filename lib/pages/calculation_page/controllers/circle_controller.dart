import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CircleController extends GetxController {
  final resultStr = "No calculated value".obs;

  final jariController = TextEditingController();

  calculateArea() {
    double? jari = double.tryParse(jariController.text);

    if (jari == null) {
      resultStr.value = "No calculated value";
    } else {
      double result = pi * pow(jari, 2);
      resultStr.value = "Calculated value: $result";
    }
  }

  reset() {
    jariController.text = "";
    resultStr.value = "No calculated value";
  }
}
