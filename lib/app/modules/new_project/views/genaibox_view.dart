import 'dart:io';

import 'package:flutter/material.dart';

import 'package:clipboard/clipboard.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ph.dart';

import '../../../services/gemini.dart';
import '../../../services/snackbar.dart';
import '../controllers/genaibox_controller.dart';

class GenAIBox extends GetView<GenAIBoxController> {
  const GenAIBox({
    super.key,
    required this.ratio,
    required this.width,
    required this.height,
  });

  final String ratio;
  final int width;
  final int height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (context.width > 768) ? 768 : context.width,
      height: 440,
      child: Flex(
        direction: Axis.vertical,
        children: [
          // gen ai type
          Obx(
            () => ChipOptions(
                currentIndex: controller.genAiType.value.index,
                children: List.generate(PromptType.values.length, (index) {
                  return Text(PromptType.values[index].name);
                }),
                onSelect: (index) {
                  controller.genAiType.value = PromptType.values[index];
                }),
          ),

          // prompt
          const Gap(8.0),
          TextFormField(
            controller: controller.promptTextController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              hintText: 'Prompt...',
            ),
          ),

          // generate button
          const Gap(8.0),
          Align(
            alignment: Alignment.centerRight,
            child: FilledButton.tonalIcon(
              onPressed: () async {
                // get prompt text
                final prompt = controller.promptTextController.text.trim();
                // generate title with gemeni
                if (controller.genAiType.value == PromptType.title) {
                  if (prompt.isNotEmpty) {
                    await controller.generateTitle(
                      prompt: prompt,
                    );
                  }
                }

                // generate image with stability ai
                if (controller.genAiType.value == PromptType.image) {
                  if (prompt.isNotEmpty) {
                    await controller.generateImage(
                      prompt: prompt,
                      ratio: ratio,
                      width: width,
                      height: height,
                    );
                  }
                }
              },
              label: const Text('Generate'),
              icon: const Iconify(Ph.star_four_duotone),
            ),
          ),

          // result
          const Gap(8.0),

          // generating progress indicator
          Obx(
            () => (controller.isLoading.value)
                ? const Expanded(
                    child: Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircularProgressIndicator.adaptive(),
                          Text('Generating'),
                        ],
                      ),
                    ),
                  )
                : const SizedBox(),
          ),

          // title generate result
          Obx(() => ((controller.genAiType.value == PromptType.title) &&
                  (!controller.isLoading.value) &&
                  (controller.listGenTitle.isNotEmpty))
              ? Expanded(
                  child: ListView.builder(
                    itemCount: controller.listGenTitle.length,
                    itemBuilder: (BuildContext context, int index) {
                      final item = controller.listGenTitle[index];
                      final title = item.title;
                      final tags = item.tags;
                      return Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        elevation: 0.0,
                        child: ListTile(
                          leading: const Icon(Icons.text_fields),
                          title: Text('$title'),
                          subtitle: Text('$tags'),
                          trailing: IconButton(
                            onPressed: () {
                              // copy
                              FlutterClipboard.copy('$title $tags').then(
                                (value) => showGetXSnackBar(
                                  title: 'Info',
                                  message: 'Copied',
                                ),
                              );
                            },
                            icon: const Icon(Icons.copy),
                          ),
                          onTap: () {
                            // copy to canvas
                            controller.setTextToCanvas(title: title ?? '');
                            Get.backLegacy();
                          },
                        ),
                      );
                    },
                  ),
                )
              : Container()),

          Obx(
            () => ((controller.genAiType.value == PromptType.image) &&
                    (!controller.isLoading.value) &&
                    (controller.listGenImage.isNotEmpty))
                ? Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                      ),
                      itemCount: controller.listGenImage.length,
                      itemBuilder: (BuildContext context, int index) {
                        final item = controller.listGenImage[index];
                        final path = item.image;
                        return Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: InkWell(
                            onTap: () {
                              controller.setImageToCanvas(path: path);
                              Get.backLegacy();
                            },
                            child: Image.file(File(path!)),
                          ),
                        );
                      },
                    ),
                  )
                : const SizedBox(),
          ),
        ],
      ),
    );
  }
}

class ChipOptions extends StatefulWidget {
  const ChipOptions({
    super.key,
    required this.currentIndex,
    required this.children,
    required this.onSelect,
  });

  final int currentIndex;
  final List<Text> children;
  final ValueChanged<int> onSelect;

  @override
  State<ChipOptions> createState() => _ChipOptionsState();
}

class _ChipOptionsState extends State<ChipOptions> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(widget.children.length, (i) {
        return Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 0.0,
          color: (widget.currentIndex == i)
              ? Theme.of(context).colorScheme.inversePrimary
              : Theme.of(context).colorScheme.primaryContainer,
          child: InkWell(
            onTap: () => widget.onSelect.call(i),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: widget.children[i],
            ),
          ),
        );
      }),
    );
  }
}
