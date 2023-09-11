import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:kalkulasi_bidang_datar/pages/calculation_page/controllers/circle_controller.dart';
import 'package:kalkulasi_bidang_datar/utils/calculation_widgets.dart';

class CircleTab extends StatelessWidget {
  CircleTab({super.key});

  final focusN = FocusNode();

  final circleController = CircleController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          textField(circleController.jariController, TextInputType.number,
              "Jari - Jari", focusN),
          Spacer(),
          Obx(() => Text(
                circleController.resultStr.value,
                style: TextStyle(fontSize: 20),
              )),
          calculationButtons(() => circleController.calculateArea(),
              () => circleController.reset())
        ],
      ),
    );
  }
}
