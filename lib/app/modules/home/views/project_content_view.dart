import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class ProjectContentView extends GetView<HomeController> {
  const ProjectContentView({super.key});
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: [
        Obx(
          () => Visibility(
            visible: (controller.geminiAPIKey.isEmpty) ||
                (controller.geminiAPIKey.isEmpty),
            child: Container(
              width: context.width,
              padding: const EdgeInsets.all(8.0),
              color: Theme.of(context).colorScheme.errorContainer,
              child: Row(
                children: [
                  const Icon(Icons.notifications),
                  const SizedBox(width: 8.0),
                  const Expanded(
                    child: Text(
                      'Please config API Key for Gemini and Stabliliy AI',
                      maxLines: 2,
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () => controller.navIndex.value = 3,
                    child: const Text('OK'),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
