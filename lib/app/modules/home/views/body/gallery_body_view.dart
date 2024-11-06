import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:sn_thumbnail/app/services/gridview.dart';

import '../../controllers/home_controller.dart';

class GalleryBodyView extends GetView<HomeController> {
  const GalleryBodyView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
      ),
      body: Obx(
        () => GridView.builder(
          itemCount: controller.listGallery.length,
          padding: const EdgeInsets.all(8.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: GridUtils.responsiveGridColumn(context.width),
          ),
          itemBuilder: (context, index) {
            final filePath = controller.listGallery[index];

            if (filePath.contains('ig')) {
              return Card(
                elevation: 0.0,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: Colors.white,
                child: InkWell(
                  onTap: () {
                    //
                  },
                  child: GridTile(
                    child: Image.file(File(filePath)),
                  ),
                ),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
