import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:kalkulasi_bidang_datar/pages/calculation_page/tabs/cirlce.dart';
import 'package:kalkulasi_bidang_datar/pages/calculation_page/tabs/kite.dart';
import 'package:kalkulasi_bidang_datar/pages/calculation_page/tabs/parallelogram.dart';
import 'package:kalkulasi_bidang_datar/pages/calculation_page/tabs/rectangle.dart';
import 'package:kalkulasi_bidang_datar/pages/calculation_page/tabs/triangle.dart';
import 'package:kalkulasi_bidang_datar/pages/settings_page/settings_page.dart';

class CalculationPage extends StatelessWidget {
  const CalculationPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Kalkulasi Bidang Datar"),
          actions: [
            IconButton(
                onPressed: () => Get.to(() => SettingsPage()),
                icon: const Icon(Icons.settings))
          ],
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(
                text: "Segitiga",
              ),
              Tab(
                text: "Persegi",
              ),
              Tab(
                text: "Lingkaran",
              ),
              Tab(
                text: "Jajar Genjang",
              ),
              Tab(
                text: "Layang - Layang",
              )
            ],
          ),
        ),
        body: SafeArea(
            child: TabBarView(children: [
          TriangleTab(),
          RectangleTab(),
          CircleTab(),
          ParallelogramTab(),
          KiteTab()
        ])),
      ),
    );
  }
}
