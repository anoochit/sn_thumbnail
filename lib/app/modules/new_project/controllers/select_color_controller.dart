import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palette_generator/palette_generator.dart';

class SelectColorController extends GetxController {
  // base color
  final List<Color> baseColor = [
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

  RxList<Color> palette = <Color>[].obs;

  updatePallete({required File file}) async {
    final imagePalette =
        await PaletteGenerator.fromImageProvider(FileImage(file));

    palette.clear();
    palette.addAll(imagePalette.colors);
    update();
  }
}
