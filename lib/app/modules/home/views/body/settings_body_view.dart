import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../data/settings_menu.dart';
import '../../../../services/preferences.dart';

class SettingsBodyView extends GetView {
  const SettingsBodyView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: settingsMenu.length,
        itemBuilder: (BuildContext context, int index) {
          final item = settingsMenu[index];
          final title = item.title;
          final icon = item.icon;
          final key = item.key;

          return Card(
            elevation: 0.0,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: ListTile(
              leading: Icon(icon),
              title: Text(title),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    final textEditingController = TextEditingController();

                    if (index == 0) {
                      textEditingController.text =
                          appController.geminiAPIKey.value;
                    } else {
                      textEditingController.text =
                          appController.stabilityAPIKey.value;
                    }

                    return AlertDialog(
                      title: Text(title),
                      content: TextFormField(
                        controller: textEditingController,
                        decoration: InputDecoration(
                          hintText: 'Edit $title',
                        ),
                        obscureText: true,
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Get.backLegacy(),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () async {
                            final value = textEditingController.text.trim();
                            if (value.isNotEmpty) {
                              // save value
                              await savePreference(key: key, value: value);
                              Get.backLegacy();
                            }
                          },
                          child: const Text('Save'),
                        )
                      ],
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
