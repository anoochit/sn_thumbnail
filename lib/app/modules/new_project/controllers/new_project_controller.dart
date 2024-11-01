import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class NewProjectController extends GetxController {
  RxDouble width = 1200.00.obs;
  RxDouble height = 1200.00.obs;

  RxString ratio = "1:1".obs;

  TextEditingController textController = TextEditingController();

  RxString text = 'Example Text'.obs;
  RxDouble fontSize = 40.0.obs;
  RxBool isBold = false.obs;

  Rx<TextAlign> textAlign = TextAlign.center.obs;

  Rx<Uint8List> backgroundImageData = Uint8List(0).obs;

  Rx<Color> fontColor = Colors.black.obs;

  @override
  void onInit() {
    super.onInit();

    // set template size
    width.value = double.parse(Get.parameters['width'] ?? '1200.00');
    height.value = double.parse(Get.parameters['height'] ?? '1200.00');
    ratio.value = Get.parameters['ratio'] ?? '1:1';

    log('w=${width.value},h=${height.value}');

    // set default text
    textController.text = text.value;
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

    log('w=$widthRatio,h=$heightRatio');

    w = scheight * (widthRatio / heightRatio);
    h = scwidth / (widthRatio / heightRatio);

    return Size((w), (h));
  }

  void textIncrease() {
    fontSize.value = fontSize.value + 2;
    update();
  }

  void textDecrease() {
    fontSize.value = fontSize.value - 2;
    update();
  }

  void textToggleBold() {
    isBold.value = !isBold.value;
    update();
  }

  void textAlignLeft() {
    textAlign.value = TextAlign.left;
    update();
  }

  void textAlignCenter() {
    textAlign.value = TextAlign.center;
    update();
  }

  void textAlignRight() {
    textAlign.value = TextAlign.right;
    update();
  }

  Future<void> backgroundImage() async {
    final xfiles = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (xfiles != null) {
      log('file = ${xfiles.path}');
      backgroundImageData.value = await xfiles.readAsBytes();
      update();
    }
  }

  setFontColor(Color color) {
    fontColor.value = color;
    update();
    Get.backLegacy();
  }
}
