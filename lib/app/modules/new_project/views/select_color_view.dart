import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/select_color_controller.dart';

class SelectedColorView extends GetView<SelectColorController> {
  const SelectedColorView(
      {super.key,
      required this.onChanged,
      required this.color,
      required this.width,
      required this.height});

  final ValueChanged<Color> onChanged;
  final Color color;
  final double width;
  final double height;

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
        title: const Text('Color picker'),
        content: SizedBox(
          width: 280.0,
          child: Obx(
            () => Wrap(
              children: controller.palette
                  .map((e) => Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ClipOval(
                          child: InkWell(
                            borderRadius: BorderRadius.circular(width),
                            onTap: () {
                              onChanged(e);
                            },
                            child: Container(
                              width: width,
                              height: height,
                              color: e,
                            ),
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
