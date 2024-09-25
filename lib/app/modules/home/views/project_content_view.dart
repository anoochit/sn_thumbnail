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
              padding: EdgeInsets.all(8.0),
              color: Theme.of(context).colorScheme.errorContainer,
              child: Row(
                children: [
                  Icon(Icons.notifications),
                  Text(
                      'Please config API Key for Gemini and Stabliliy AI in your profile!'),
                  Spacer(),
                  OutlinedButton(
                    onPressed: () => controller.navIndex.value = 3,
                    child: Text('Goto Profile'),
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
