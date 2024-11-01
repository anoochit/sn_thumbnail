import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:sn_thumbnail/app/services/gridview.dart';

import '../../controllers/home_controller.dart';

class LibraryBodyView extends GetView<HomeController> {
  const LibraryBodyView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Library'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
      ),
      body: Obx(
        () => GridView.builder(
          itemCount: controller.listFiles.length,
          padding: const EdgeInsets.all(8.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: GridUtils.responsiveGridColumn(context.width),
          ),
          itemBuilder: (context, index) {
            final filePath = controller.listFiles[index];

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
          },
        ),
      ),
    );
  }
}
