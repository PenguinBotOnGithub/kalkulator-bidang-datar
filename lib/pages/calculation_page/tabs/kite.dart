import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:kalkulasi_bidang_datar/pages/calculation_page/controllers/kite_controller.dart';
import 'package:kalkulasi_bidang_datar/utils/calculation_widgets.dart';

class KiteTab extends StatelessWidget {
  KiteTab({super.key});

  final kiteController = KiteController();

  final focusN1 = FocusNode();
  final focusN2 = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          textField(kiteController.diagonalController1, TextInputType.number,
              "Garis Diagonal 1", focusN1),
          SizedBox(
            height: 10,
          ),
          textField(kiteController.diagonalController2, TextInputType.number,
              "Garis Diagonal 2", focusN2),
          Spacer(),
          Obx(() => Text(
                kiteController.resultStr.value,
                style: TextStyle(fontSize: 20),
              )),
          calculationButtons(() => kiteController.calculateArea(),
              () => kiteController.reset())
        ],
      ),
    );
  }
}
