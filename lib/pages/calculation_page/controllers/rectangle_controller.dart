import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

enum RectangleCalcType { samaSisi, panjang }

class RectangleController extends GetxController {
  final resultStr = "No calculated value".obs;
  final calcType = RectangleCalcType.samaSisi.obs;

  final side1Controller = TextEditingController();
  final side2Controller = TextEditingController();

  calculateAreaPanjang() {
    double? sisi1 = double.tryParse(side1Controller.text);
    double? sisi2 = double.tryParse(side2Controller.text);

    if (sisi1 == null || sisi2 == null) {
      resultStr.value = "No calculated value";
    } else {
      double result = sisi1 * sisi2;
      resultStr.value = "Calculated value: $result";
    }
  }

  // UI / UI-State related code

  calculateAreaSamaSisi() {
    double? sisi1 = double.tryParse(side1Controller.text);

    if (sisi1 == null) {
      resultStr.value = "No calculated value";
    } else {
      double result = sisi1 * sisi1;
      resultStr.value = "Calculated value: $result";
    }
  }

  reset() {
    resultStr.value = "No calculated value";
    side1Controller.text = "";
    side2Controller.text = "";
  }

  void changeRectangleCalcType(RectangleCalcType? value) {
    calcType.value = value!;
    reset();
  }
}
