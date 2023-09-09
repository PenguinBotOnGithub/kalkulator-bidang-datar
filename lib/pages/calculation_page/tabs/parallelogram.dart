import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:kalkulasi_bidang_datar/pages/calculation_page/controllers/parallelogram_controller.dart';
import 'package:kalkulasi_bidang_datar/utils/calculation_widgets.dart';

class ParallelogramTab extends StatelessWidget {
  ParallelogramTab({super.key});

  final parallelogramController = ParallelogramController();

  final focusN1 = FocusNode();
  final focusN2 = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          textField(parallelogramController.alasController,
              TextInputType.number, "Alas", focusN1),
          SizedBox(
            height: 10,
          ),
          textField(parallelogramController.tinggiController,
              TextInputType.number, "Tinggi", focusN2),
          Spacer(),
          Obx(() => Text(parallelogramController.resultStr.value)),
          calculationButtons(() => parallelogramController.calculateArea(),
              () => parallelogramController.reset())
        ],
      ),
    );
  }
}
