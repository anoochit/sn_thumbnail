import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';
import '../../../../services/gridview.dart';
import '../../../../services/snackbar.dart';
import '../../../view_image/controllers/view_image_controller.dart';
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
        () => (controller.listLibrary.isNotEmpty)
            ? GridView.builder(
                itemCount: controller.listLibrary.length,
                padding: const EdgeInsets.all(8.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: GridUtils.responsiveGridColumn(context.width),
                ),
                itemBuilder: (context, index) {
                  final filePath = controller.listLibrary[index];

                  return Card(
                    elevation: 0.0,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: InkWell(
                      onTap: () {
                        // show preview
                        Get.put(ViewImageController()).path.value = filePath;
                        Get.toNamed(Routes.VIEW_IMAGE);
                      },
                      onLongPress: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Delete ?'),
                              content:
                                  const Text('Do you to delete this file?'),
                              actions: [
                                TextButton(
                                    onPressed: () => Get.backLegacy(),
                                    child: const Text('No')),
                                TextButton(
                                    onPressed: () async {
                                      await File(filePath).delete().then((v) {
                                        Get.find<HomeController>().loadFiles();
                                        showGetXSnackBar(
                                            title: 'Delete',
                                            message: 'Image deleted!');
                                      });
                                      Get.backLegacy();
                                    },
                                    child: const Text('Yes')),
                              ],
                            );
                          },
                        );
                      },
                      child: GridTile(
                        child: Hero(
                          tag: filePath,
                          child: Image.file(
                            File(filePath),
                            filterQuality: FilterQuality.high,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )
            : const Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.inbox_outlined),
                    Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text('No Data'),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
