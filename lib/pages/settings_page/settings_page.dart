import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kalkulasi_bidang_datar/utils/hive_config_manager.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({super.key});

  final ConfigManager configManager = ConfigManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: ValueListenableBuilder(
        valueListenable: ConfigManager.configBox!.listenable(),
        builder: (BuildContext context, value, Widget? child) {
          bool darkTheme = ConfigManager.themeType == ThemeType.dark;
          return ListView(
            children: [
              ListTile(
                title: const Text("Application theme"),
                subtitle: Wrap(
                  children: [
                    const Text("Switch between light and dark theme"),
                    const SizedBox(
                      width: 5,
                    ),
                    darkTheme
                        ? const Icon(Icons.dark_mode)
                        : const Icon(Icons.light_mode),
                  ],
                ),
                trailing: Switch(
                    value: darkTheme, onChanged: configManager.changeTheme),
              ),
              ListTile(
                title: const Text("Use Material3 theme"),
                subtitle:
                    const Text("Switch between Material3 and Material2 design"),
                trailing: Switch(
                    value: ConfigManager.materialSwitch!,
                    onChanged: configManager.changeMaterial),
              ),
              ListTile(
                title: const Text("Application color seed"),
                subtitle: const Text("Change application's color scheme"),
                trailing: TapRegion(
                    onTapInside: (event) => configManager.changeSeed(context),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: ConfigManager.colorSeed,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: const Icon(Icons.colorize),
                    )),
              )
            ],
          );
        },
      ),
    );
  }
}
