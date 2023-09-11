import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

enum TriangleCalcType { luas, phyA, phyB, phyC }

class TriangleController extends GetxController {
  final resultStr = "No calculated value".obs;
  final calcType = TriangleCalcType.luas.obs;

  final alasController = TextEditingController();
  final tinggiController = TextEditingController();

  final side1Controller = TextEditingController();
  final side2Controller = TextEditingController();

  calculateArea() {
    double? alas = double.tryParse(alasController.text);
    double? tinggi = double.tryParse(tinggiController.text);

    if (alas == null || tinggi == null) {
      resultStr.value = "Only valid numbers are allowed";
    } else {
      double result = (alas * tinggi) / 2;
      resultStr.value = "Calculated value: $result";
    }
  }

  calculatePythagorasC() {
    double? sisiA = double.tryParse(side1Controller.text);
    double? sisiB = double.tryParse(side2Controller.text);

    if (sisiA == null || sisiB == null) {
      resultStr.value = "Only valid numbers are allowed";
    } else {
      double result = sqrt(pow(sisiA, 2) + pow(sisiB, 2));
      resultStr.value = "Calculated value: $result";
    }
  }

  calculatePythagorasA() {
    double? sisiB = double.tryParse(side1Controller.text);
    double? sisiC = double.tryParse(side2Controller.text);

    if (sisiB == null || sisiC == null) {
      resultStr.value = "Only valid numbers are allowed";
    } else {
      double result = sqrt(pow(sisiC, 2) - pow(sisiB, 2));
      resultStr.value = "Calculated value: $result";
    }
  }

  calculatePythagorasB() {
    double? sisiA = double.tryParse(side1Controller.text);
    double? sisiC = double.tryParse(side2Controller.text);

    if (sisiA == null || sisiC == null) {
      resultStr.value = "Only valid numbers are allowed";
    } else {
      double result = sqrt(pow(sisiC, 2) - pow(sisiA, 2));
      resultStr.value = "Calculated value: $result";
    }
  }

  // UI / UI-State related code

  reset() {
    resultStr.value = "No calculated value";
    alasController.text = "";
    tinggiController.text = "";
    side1Controller.text = "";
    side2Controller.text = "";
  }

  void changeTriangleCalcType(TriangleCalcType? val) {
    calcType.value = val!;
    reset();
  }
}
