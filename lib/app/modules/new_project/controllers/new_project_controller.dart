import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:developer';

class NewProjectController extends GetxController {
  RxDouble width = 1200.00.obs;
  RxDouble height = 1200.00.obs;

  RxString ratio = "1:1".obs;

  TextEditingController textController = TextEditingController();

  late TextStyle textStyle;

  @override
  void onInit() {
    super.onInit();

    // set template size
    width.value = double.parse(Get.parameters['width'] ?? '1200.00');
    height.value = double.parse(Get.parameters['height'] ?? '1200.00');
    ratio.value = Get.parameters['ratio'] ?? '1:1';

    print('w=${width.value},h=${height.value}');

    // set default text
    textController.text = 'Example Text';

    // text style
    textStyle = GoogleFonts.kanit(fontSize: 40.0, height: 0.98);
  }

  Size calculateCanvasSize(
    double scwidth,
    double scheight,
  ) {
    double w = scwidth;
    double h = scheight;

    final ratioValue = ratio.value.split(':');
    final widthRatio = double.parse(ratioValue[0]);
    final heightRatio = double.parse(ratioValue[1]);

    print('w=${widthRatio},h=${heightRatio}');

    w = scheight * (widthRatio / heightRatio);
    h = scwidth / (widthRatio / heightRatio);

    return Size((w), (h));
  }
}
