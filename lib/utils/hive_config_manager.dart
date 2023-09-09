import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

part 'hive_config_manager.g.dart';

@HiveType(typeId: 1)
enum ThemeType {
  @HiveField(0)
  light,
  @HiveField(1)
  dark
}

class ConfigManager {
  ConfigManager() {
    if (configBox == null) {
      throw StateError(
          "ERROR: configBox is null. Have you called ConfigManager.init()?");
    }
  }

  static ThemeType? themeType;
  static Color? colorSeed;
  static bool? materialSwitch;
  static Box? configBox;
  static init() async {
    configBox = await Hive.openBox("settings");
    colorSeed = Color(configBox!.get("seed",
        defaultValue: const Color.fromARGB(255, 0, 153, 255).value));
    themeType = configBox!.get("theme", defaultValue: ThemeType.dark);
    materialSwitch = configBox!.get("material", defaultValue: true);
    return ConfigManager();
  }

  ThemeData initTheme() {
    return ThemeData.from(
        useMaterial3: materialSwitch,
        colorScheme: ColorScheme.fromSeed(
            seedColor: colorSeed!,
            brightness: switch (themeType!) {
              ThemeType.dark => Brightness.dark,
              ThemeType.light => Brightness.light
            }));
  }

  changeTheme(bool value) {
    ThemeType newTheme = value ? ThemeType.dark : ThemeType.light;
    configBox!.put("theme", newTheme);
    reloadConfig();
    setTheme();
  }

  changeSeed(BuildContext context) async {
    Color newColor = colorSeed!;
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              titlePadding: EdgeInsets.all(0),
              contentPadding: EdgeInsets.all(0),
              content: SingleChildScrollView(
                child: HueRingPicker(
                  pickerColor: newColor,
                  onColorChanged: (Color value) => newColor = value,
                  enableAlpha: false,
                  displayThumbColor: true,
                ),
              ),
            ));
    configBox!.put("seed", newColor.value);
    reloadConfig();
    setTheme();
  }

  changeMaterial(bool value) {
    configBox!.put("material", value);
    reloadConfig();
    setTheme();
  }

  reloadConfig() {
    colorSeed = Color(configBox!.get("seed",
        defaultValue: const Color.fromARGB(255, 0, 153, 255).value));
    themeType = configBox!.get("theme", defaultValue: ThemeType.dark);
    materialSwitch = configBox!.get("material", defaultValue: true);
  }

  setTheme() {
    Get.changeTheme(ThemeData.from(
        useMaterial3: materialSwitch,
        colorScheme: ColorScheme.fromSeed(
            seedColor: colorSeed!,
            brightness: switch (themeType!) {
              ThemeType.dark => Brightness.dark,
              ThemeType.light => Brightness.light
            })));

    // Force app update (workaround for theme not changing in Android)
    Get.forceAppUpdate();
  }
}
