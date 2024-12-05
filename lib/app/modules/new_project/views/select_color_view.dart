import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/select_color_controller.dart';

class SelectedColorView extends GetView<SelectColorController> {
  const SelectedColorView(
      {super.key,
      required this.onChanged,
      required this.color,
      required this.width,
      required this.height,
      required this.title});

  final ValueChanged<Color> onChanged;
  final Color color;
  final double width;
  final double height;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(width),
        onTap: () => showColorDialog(context),
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(width),
            border: Border.all(
              color: Colors.grey,
            ),
          ),
          width: width,
          height: height,
        ),
      ),
    );
  }

  showColorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: SizedBox(
          width: (width * 2) * 6,
          child: Obx(() {
            final totalColors =
                (controller.baseColor.length + controller.palette.value.length);
            final colors = <Color>[];
            colors.addAll(controller.baseColor);
            colors.addAll(controller.palette.value);
            return Wrap(
              children: List.generate(totalColors, (index) {
                final item = colors[index];
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ClipOval(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(width),
                      onTap: () {
                        onChanged(item);
                      },
                      child: Container(
                        width: width * 2,
                        height: height * 2,
                        color: item,
                      ),
                    ),
                  ),
                );
              }),
            );
          }),
        ),
      ),
    );
  }
}
