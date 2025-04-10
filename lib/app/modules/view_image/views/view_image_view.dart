import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/view_image_controller.dart';

class ViewImageView extends GetView<ViewImageController> {
  const ViewImageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          // centerTitle: true,
          ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Hero(
              tag: controller.path.value,
              child: Obx(
                () => Image.file(
                  File(controller.path.value),
                  filterQuality: FilterQuality.high,
                ),
              )),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.saveToGallery(controller.path.value),
        child: Icon(Icons.download),
      ),
    );
  }
}
