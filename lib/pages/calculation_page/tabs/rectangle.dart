import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:kalkulasi_bidang_datar/pages/calculation_page/controllers/rectangle_controller.dart';
import 'package:kalkulasi_bidang_datar/utils/calculation_widgets.dart';

class RectangleTab extends StatelessWidget {
  RectangleTab({super.key});

  final rectangleController = RectangleController();
  final focusN1 = FocusNode();
  final focusN2 = FocusNode();
  final focusN3 = FocusNode();

  final calcTypeMap = <String, RectangleCalcType>{
    "Persegi Sama Sisi": RectangleCalcType.samaSisi,
    "Persegi Panjang": RectangleCalcType.panjang,
  };

  Widget samaSisiCalc() {
    return Column(
      key: const Key("sama-sisi"),
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        textField(rectangleController.side1Controller, TextInputType.number,
            "Sisi 1", focusN1),
        const Spacer(),
        Obx(() => Text(rectangleController.resultStr.value)),
        calculationButtons(() => rectangleController.calculateAreaSamaSisi(),
            () => rectangleController.reset())
      ],
    );
  }

  Widget panjangCalc() {
    return Column(
      key: const Key("panjang"),
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        textField(rectangleController.side1Controller, TextInputType.number,
            "Sisi 1", focusN1),
        const SizedBox(
          height: 10,
        ),
        textField(rectangleController.side2Controller, TextInputType.number,
            "Sisi 2", focusN2),
        const Spacer(),
        Obx(() => Text(rectangleController.resultStr.value)),
        calculationButtons(() => rectangleController.calculateAreaPanjang(),
            () => rectangleController.reset())
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          Obx(() => dropDown<RectangleCalcType>(
              focusN3,
              rectangleController.calcType.value,
              calcTypeMap,
              rectangleController.changeRectangleCalcType)),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: Obx(() => AnimatedSwitcher(
                    duration: const Duration(milliseconds: 100),
                    child: switch (rectangleController.calcType.value) {
                      RectangleCalcType.samaSisi => samaSisiCalc(),
                      RectangleCalcType.panjang => panjangCalc(),
                    },
                  ))),
        ],
      ),
    );
  }
}
