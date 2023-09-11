import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:kalkulasi_bidang_datar/pages/calculation_page/controllers/triangle_controller.dart';
import 'package:kalkulasi_bidang_datar/utils/calculation_widgets.dart';

class TriangleTab extends StatelessWidget {
  TriangleTab({super.key});

  final triangleController = TriangleController();
  final focusN1 = FocusNode();
  final focusN2 = FocusNode();
  final focusN3 = FocusNode();

  final calcTypeMap = <String, TriangleCalcType>{
    "Luas": TriangleCalcType.luas,
    "Phytagoras Sisi Tinggi": TriangleCalcType.phyA,
    "Phytagoras Sisi Alas": TriangleCalcType.phyB,
    "Phytagoras Sisi Miring": TriangleCalcType.phyC,
  };

  Widget luasCalc(BuildContext context) {
    return Column(
      key: const Key("luas"),
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        textField(triangleController.alasController, TextInputType.number,
            "Alas", focusN1),
        const SizedBox(
          height: 10,
        ),
        textField(triangleController.tinggiController, TextInputType.number,
            "Tinggi", focusN2),
        const Spacer(),
        Obx(() => Text(
              triangleController.resultStr.value,
              style: TextStyle(fontSize: 20),
            )),
        calculationButtons(() => triangleController.calculateArea(),
            () => triangleController.reset())
      ],
    );
  }

  Widget phyACalc(BuildContext context) {
    return Column(
      key: const Key("phyA"),
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        textField(triangleController.side1Controller, TextInputType.number,
            "Sisi B", focusN1),
        const SizedBox(
          height: 10,
        ),
        textField(triangleController.side2Controller, TextInputType.number,
            "Sisi C", focusN2),
        const Spacer(),
        Obx(() => Text(
              triangleController.resultStr.value,
              style: TextStyle(fontSize: 20),
            )),
        calculationButtons(() => triangleController.calculatePythagorasA(),
            () => triangleController.reset())
      ],
    );
  }

  Widget phyBCalc(BuildContext context) {
    return Column(
      key: const Key("phyB"),
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        textField(triangleController.side1Controller, TextInputType.number,
            "Sisi A", focusN1),
        const SizedBox(
          height: 10,
        ),
        textField(triangleController.side2Controller, TextInputType.number,
            "Sisi C", focusN2),
        const Spacer(),
        Obx(() => Text(
              triangleController.resultStr.value,
              style: TextStyle(fontSize: 20),
            )),
        calculationButtons(() => triangleController.calculatePythagorasB(),
            () => triangleController.reset())
      ],
    );
  }

  Widget phyCCalc(BuildContext context) {
    return Column(
      key: const Key("phyC"),
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        textField(triangleController.side1Controller, TextInputType.number,
            "Sisi A", focusN1),
        const SizedBox(
          height: 10,
        ),
        textField(triangleController.side2Controller, TextInputType.number,
            "Sisi B", focusN2),
        const Spacer(),
        Obx(() => Text(
              triangleController.resultStr.value,
              style: TextStyle(fontSize: 20),
            )),
        calculationButtons(() => triangleController.calculatePythagorasC(),
            () => triangleController.reset())
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: [
            Obx(() => dropDown<TriangleCalcType>(
                focusN3,
                triangleController.calcType.value,
                calcTypeMap,
                triangleController.changeTriangleCalcType)),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Obx(() => AnimatedSwitcher(
                    duration: const Duration(milliseconds: 100),
                    child: switch (triangleController.calcType.value) {
                      TriangleCalcType.luas => luasCalc(context),
                      TriangleCalcType.phyA => phyACalc(context),
                      TriangleCalcType.phyB => phyBCalc(context),
                      TriangleCalcType.phyC => phyCCalc(context),
                    },
                  )),
            ),
          ],
        ));
  }
}
