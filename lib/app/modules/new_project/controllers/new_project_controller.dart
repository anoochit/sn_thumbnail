import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_scaler/image_scaler.dart';
import 'package:image_scaler/types.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';

import 'package:sn_thumbnail/app/modules/home/controllers/home_controller.dart';

class NewProjectController extends GetxController {
  RxDouble width = 1200.00.obs;
  RxDouble height = 1200.00.obs;
  RxString ratio = "1:1".obs;

  TextEditingController textController = TextEditingController();
  RxString text = 'Example Text'.obs;
  RxDouble fontSize = 40.0.obs;
  RxBool isBold = false.obs;
  Rx<TextAlign> textAlign = TextAlign.center.obs;
  Rx<Color> fontColor = Colors.black.obs;

  Rx<Uint8List> backgroundImageData = Uint8List(0).obs;

  ScreenshotController screenshotController = ScreenshotController();
  String exportFilename = 'sn${DateTime.now().millisecondsSinceEpoch}.png';

  RxBool editVisible = false.obs;

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

  Future<void> exportImage() async {
    setEditVisible(false);
    try {
      final image = await screenshotController.capture(
          delay: const Duration(milliseconds: 200));

      if (image != null) {
        // convert uint8list to ui.Image
        final Completer<ui.Image> completer = Completer();
        ui.decodeImageFromList(image, (ui.Image img) {
          completer.complete(img);
        });
        final uiImage = await completer.future;

        // scale image
        final scaleImage = await scale(
            image: uiImage,
            newSize: IntSize(width.toInt(), height.toInt()),
            algorithm: ScaleAlgorithm.lanczos);

        // save image
        saveImageToFile(scaleImage).then((file) {
          final homeController = Get.find<HomeController>();
          homeController.loadFiles();

          Get.snackbar('Info', file.path);
        });
      } else {
        Get.snackbar('Error', 'Cannot capture image');
      }
    } catch (e) {
      Get.snackbar('Error', 'Cannot export scaled image');
    }
  }

  Future<File> saveImageToFile(ui.Image image) async {
    final Uint8List bytes = await convertImageToBytes(image);
    final directory = await getApplicationDocumentsDirectory();

    final filePath = '${directory.path}/sn/$exportFilename';
    final file = File(filePath);
    await file.writeAsBytes(bytes);
    return file;
  }

  Future<Uint8List> convertImageToBytes(ui.Image image) async {
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    return byteData!.buffer.asUint8List();
  }

  void setEditVisible(bool value) {
    editVisible.value = value;
    update();
  }
}
