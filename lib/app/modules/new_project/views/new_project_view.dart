import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:screenshot/screenshot.dart';

import '../controllers/dragable_contreoller.dart';
import '../controllers/new_project_controller.dart';
import 'dragable_widget_view.dart';
import 'genaibox_view.dart';
import 'select_color_view.dart';

class NewProjectView extends GetView {
  const NewProjectView({super.key});

  hideDraggableBorder() {
    Get.put(DraggableController()).visible.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewProjectController>(
      init: NewProjectController(),
      builder: (controller) {
        hideDraggableBorder();
        return Scaffold(
          appBar: AppBar(
            title: const Text('New project'),
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            centerTitle: true,
            actions: [exportButton(controller, context)],
            bottom: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
              title: buildToolbar(context, controller),
              centerTitle: true,
            ),
          ),
          body: Stack(
            children: [
              buildCanvas(controller),
            ],
          ),
          // floatingActionButton: exportButton(controller, context),
        );
      },
    );
  }

  Widget exportButton(NewProjectController controller, BuildContext context) {
    return IconButton(
      onPressed: () {
        //
        hideDraggableBorder();
        // export image
        controller.exportImage();
      },
      icon: const Icon(Icons.download),
    );
  }

  Widget buildToolbar(BuildContext context, NewProjectController controller) {
    return Row(
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
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: SelectedColorView(
            title: 'Font Color',
            width: 24.0,
            height: 24.0,
            onChanged: (value) => controller.setFontColor(value),
            color: controller.fontColor.value,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: SelectedColorView(
            title: 'Backgound Color',
            width: 24.0,
            height: 24.0,
            onChanged: (value) => controller.setBackgroundColor(value),
            color: controller.backgroundColor.value,
          ),
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
            // background image
            controller.backgroundImage();
          },
          icon: const Icon(Icons.image),
        ),
        IconButton(
          onPressed: () {
            // gen ai dialog
            buildGenAIDialog(context, controller);
          },
          icon: const Iconify(Ph.star_four_duotone),
        ),
      ],
    );
  }

  Widget buildCanvas(NewProjectController controller) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: LayoutBuilder(builder: (context, constraints) {
          final size = controller.calculateCanvasSize(
            constraints.maxWidth,
            constraints.maxHeight,
          );

          return Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0)),
            child: Container(
              width: size.width,
              height: size.height,
              color: Colors.white,
              child: GestureDetector(
                onTap: () {
                  controller.setEditVisible(false);
                },
                child: Screenshot(
                  controller: controller.screenshotController,
                  child: Container(
                    width: size.width,
                    height: size.height,
                    color: controller.backgroundColor.value,
                    child: Stack(
                      children: [
                        // backgound image
                        (controller.backgroundImageData.value.lengthInBytes ==
                                0)
                            ? const SizedBox()
                            : Positioned.fill(
                                child: Image.memory(
                                  controller.backgroundImageData.value,
                                  fit: BoxFit.cover,
                                ),
                              ),
                        // text field
                        DraggableWidgetView(
                            // visible: controller.editVisible.value,
                            child: Padding(
                          padding: const EdgeInsets.all(36.0),
                          child: TextFormField(
                            controller: controller.textController,
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                            textAlign: controller.textAlign.value,
                            style: GoogleFonts.sriracha(
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
                              // controller.setEditVisible(true);
                              Get.put(DraggableController()).visible.value =
                                  true;
                            },
                            onTapOutside: (event) {
                              log('tap outside');
                              Get.put(DraggableController()).visible.value =
                                  false;
                              FocusScope.of(context).requestFocus(FocusNode());
                            },
                          ),
                        )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  void buildGenAIDialog(BuildContext context, NewProjectController controller) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            children: [
              const Text('Generative AI'),
              const Spacer(),
              IconButton.filledTonal(
                onPressed: () => Get.backLegacy(),
                icon: const Icon(Icons.close),
              )
            ],
          ),
          content: GenAIBox(
            ratio: controller.ratio.value,
            width: controller.width.value.toInt(),
            height: controller.height.value.toInt(),
          ),
        );
      },
    );
  }
}
