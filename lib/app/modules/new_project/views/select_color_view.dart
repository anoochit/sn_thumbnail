import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SelectedColorView extends GetView {
  SelectedColorView(
      {super.key,
      required this.onChanged,
      required this.color,
      required this.width,
      required this.height});

  final ValueChanged<Color> onChanged;
  final Color color;
  final double width;
  final double height;

  final List<Color> colors = [
    Colors.red,
    Colors.pink,
    Colors.purple,
    Colors.deepPurple,
    Colors.indigo,
    Colors.blue,
    Colors.lightBlue,
    Colors.cyan,
    Colors.teal,
    Colors.green,
    Colors.lightGreen,
    Colors.lime,
    Colors.yellow,
    Colors.amber,
    Colors.orange,
    Colors.deepOrange,
    Colors.brown,
    Colors.grey,
    Colors.black,
    Colors.white,
  ];

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
        content: SizedBox(
          width: 280.0,
          child: Wrap(
            children: colors
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
    );
  }
}
