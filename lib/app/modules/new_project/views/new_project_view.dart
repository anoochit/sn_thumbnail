import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/new_project_controller.dart';

class NewProjectView extends GetView<NewProjectController> {
  const NewProjectView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New project'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
      ),
      body: GetBuilder<NewProjectController>(
        builder: (controller) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: LayoutBuilder(builder: (context, constraints) {
                final size = controller.calculateLocalSize(
                    constraints.maxWidth, constraints.maxHeight);
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  child: Container(
                    color: Colors.white,
                    width: size.width,
                    height: size.height,
                    child: Stack(
                      children: [
                        Center(
                          child: TextFormField(
                            controller: controller.textController,
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                            textAlign: TextAlign.center,
                            style: controller.textStyle,
                            maxLines: null,
                            onTap: () => log('tap inside'),
                            onTapOutside: (event) {
                              log('tap outside');
                              FocusScope.of(context).requestFocus(FocusNode());
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
            ),
          );
        },
      ),
    );
  }
}
