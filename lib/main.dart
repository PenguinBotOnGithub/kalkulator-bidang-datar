import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kalkulasi_bidang_datar/pages/calculation_page/calculation_page.dart';
import 'package:kalkulasi_bidang_datar/utils/hive_config_manager.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ThemeTypeAdapter());
  await ConfigManager.init();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final ConfigManager configManager = ConfigManager();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: configManager.initTheme(),
      home: const CalculationPage(),
    );
  }
}
