import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:sn_thumbnail/app/services/gemini.dart';

import '../controllers/genaibox_controller.dart';

class GenAIBox extends GetView<GenAIBoxController> {
  const GenAIBox({
    super.key,
  });

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
                currentIndex: controller.genAiTypeIndex.value,
                children: List.generate(PromptType.values.length, (index) {
                  return Text(PromptType.values[index].name);
                }),
                onSelect: (index) {
                  controller.genAiTypeIndex.value = index;
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

          const Gap(8.0),
          Align(
            alignment: Alignment.centerRight,
            child: FilledButton.tonalIcon(
              onPressed: () {
                // generate
              },
              label: const Text('Generate'),
              icon: const Iconify(Ph.star_four_duotone),
            ),
          )

          // result
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
