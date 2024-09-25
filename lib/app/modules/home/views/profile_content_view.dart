import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/models/schemas.dart';
import '../../../services/realm.dart';
import '../controllers/home_controller.dart';

class ProfileContentView extends GetView<HomeController> {
  const ProfileContentView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final geminiAPI = (controller.geminiAPIKey.value.isNotEmpty)
          ? controller.geminiAPIKey.value.substring(0, 10)
          : 'no-api-key';
      final stabilityAPI = (controller.stabilityAPIKey.value.isNotEmpty)
          ? controller.stabilityAPIKey.value.substring(0, 10)
          : 'no-api-key';
      return ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.api),
            title: const Text('Gemini API Key'),
            trailing: Text(
              geminiAPI,
              style: Theme.of(context).textTheme.labelSmall,
            ),
            onTap: () {
              // update
              geminiDialog(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.api),
            title: const Text('Stability API Key'),
            trailing: Text(
              stabilityAPI,
              style: Theme.of(context).textTheme.labelSmall,
            ),
            onTap: () {
              // update
              stabilityDialog(context);
            },
          )
        ],
      );
    });
  }

  Future<dynamic> geminiDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        final textConttroller = TextEditingController();
        return AlertDialog(
          title: const Text('Gemini API Key'),
          content: TextFormField(
            controller: textConttroller,
            decoration: const InputDecoration(
              hintText: 'API Key',
            ),
          ),
          actions: [
            FilledButton(
              onPressed: () {
                //
                final id = controller.preference.value.id;
                final geminiAPIKey = textConttroller.text.trim();
                final stabilityAPIKey =
                    controller.preference.value.stabilityAPIKey;
                final data = Preference(id, geminiAPIKey, stabilityAPIKey);
                realm.write(() {
                  realm.add<Preference>(data, update: true);
                });
              },
              child: const Text('Save'),
            ),
            FilledButton.tonal(
              onPressed: () {
                Get.backLegacy(closeOverlays: true);
              },
              child: const Text('Cancel'),
            )
          ],
        );
      },
    );
  }

  Future<dynamic> stabilityDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        final textConttroller = TextEditingController();
        return AlertDialog(
          title: const Text('Stability API Key'),
          content: TextFormField(
            controller: textConttroller,
            decoration: const InputDecoration(
              hintText: 'API Key',
            ),
          ),
          actions: [
            FilledButton(
              onPressed: () {
                //
                final id = controller.preference.value.id;
                final geminiAPIKey = controller.preference.value.geminiAPIKey;
                final stabilityAPIKey = textConttroller.text.trim();
                final data = Preference(id, geminiAPIKey, stabilityAPIKey);
                realm.write(() {
                  realm.add<Preference>(data, update: true);
                });
              },
              child: const Text('Save'),
            ),
            FilledButton.tonal(
              onPressed: () {
                Get.backLegacy(closeOverlays: true);
              },
              child: const Text('Cancel'),
            )
          ],
        );
      },
    );
  }
}
