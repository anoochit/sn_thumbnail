import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screenshot/screenshot.dart';

import '../controllers/new_project_controller.dart';
import 'select_color_view.dart';

class NewProjectView extends GetView {
  const NewProjectView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewProjectController>(
      init: NewProjectController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('New project'),
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            centerTitle: true,
          ),
          body: Stack(
            children: [
              // canvas
              buildCanvas(controller),

              // toolbar
              buildToolbar(controller),
            ],
          ),
          floatingActionButton: exportButton(controller, context),
        );
      },
    );
  }

  FloatingActionButton exportButton(
      NewProjectController controller, BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        // export image
        controller.exportImage();
      },
      child: const Icon(Icons.download),
    );
  }

  Align buildToolbar(NewProjectController controller) {
    return Align(
      alignment: Alignment.topCenter,
      child: Card(
        elevation: 0.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {
                  // text increase
                  controller.textIncrease();
                },
                icon: const Icon(Icons.text_increase),
              ),
              IconButton(
                onPressed: () {
                  // text decrease
                  controller.textDecrease();
                },
                icon: const Icon(Icons.text_decrease),
              ),
              IconButton(
                onPressed: () {
                  // text bold
                  controller.textToggleBold();
                },
                icon: const Icon(Icons.format_bold),
              ),
              SelectedColorView(
                width: 24.0,
                height: 24.0,
                onChanged: (value) => controller.setFontColor(value),
                color: controller.fontColor.value,
              ),
              IconButton(
                onPressed: () {
                  // text left
                  controller.textAlignLeft();
                },
                icon: const Icon(Icons.format_align_left),
              ),
              IconButton(
                onPressed: () {
                  // text center
                  controller.textAlignCenter();
                },
                icon: const Icon(Icons.format_align_center),
              ),
              IconButton(
                onPressed: () {
                  // text right
                  controller.textAlignRight();
                },
                icon: const Icon(Icons.format_align_right),
              ),
              IconButton(
                onPressed: () {
                  // text right
                  controller.backgroundImage();
                },
                icon: const Icon(Icons.image),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCanvas(NewProjectController controller) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: LayoutBuilder(builder: (context, constraints) {
          final size = controller.calculateCanvasSize(
            constraints.maxWidth,
            constraints.maxHeight,
          );
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
            ),
            child: Screenshot(
              controller: controller.screenshotController,
              child: Container(
                color: Colors.white,
                width: size.width,
                height: size.height,
                child: Stack(
                  children: [
                    // backgound image
                    (controller.backgroundImageData.value.lengthInBytes == 0)
                        ? const SizedBox()
                        : Positioned.fill(
                            child: Image.memory(
                              controller.backgroundImageData.value,
                              fit: BoxFit.cover,
                            ),
                          ),
                    // text field
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(36.0),
                        child: TextFormField(
                          controller: controller.textController,
                          decoration:
                              const InputDecoration(border: InputBorder.none),
                          textAlign: controller.textAlign.value,
                          style: GoogleFonts.kanit(
                            fontSize: controller.fontSize.value,
                            fontWeight: (controller.isBold.value)
                                ? FontWeight.w500
                                : FontWeight.w400,
                            color: controller.fontColor.value,
                          ),
                          maxLines: null,
                          onChanged: (value) {
                            controller.text.value = value;
                          },
                          onTap: () {
                            log('tap inside');
                          },
                          onTapOutside: (event) {
                            log('tap outside');
                            FocusScope.of(context).requestFocus(FocusNode());
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
