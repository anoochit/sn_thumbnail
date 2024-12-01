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
        title: const Text('View'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => controller.saveToGallery(controller.path.value),
              icon: const Icon(Icons.download))
        ],
      ),
      body: Center(
        child: Obx(() => Image.file(
              File(controller.path.value),
              filterQuality: FilterQuality.high,
            )),
      ),
    );
  }
}
