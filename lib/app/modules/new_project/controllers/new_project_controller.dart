import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_scaler/image_scaler.dart';
import 'package:image_scaler/types.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';

import '../../../services/snackbar.dart';
import '../../home/controllers/home_controller.dart';
import 'select_color_controller.dart';

class NewProjectController extends GetxController {
  // canvas size
  RxDouble width = 1200.00.obs;
  RxDouble height = 1200.00.obs;
  RxString ratio = "1:1".obs;
  Rx<Size> canvasSize = Size.zero.obs;

  // template
  Rx<String> template = ''.obs;

  // text
  TextEditingController textController = TextEditingController();
  RxString text = 'text'.obs;
  RxBool isBold = false.obs;
  RxBool isItalic = false.obs;
  Rx<TextAlign> textAlign = TextAlign.left.obs;
  Rx<Color> fontColor = Colors.black.obs;
  Rx<Color> backgroundColor = Colors.white.obs;

  // background image
  Rx<Uint8List> backgroundImageData = Uint8List(0).obs;

  // screenshot controller
  ScreenshotController screenshotController = ScreenshotController();

  // edit controller
  RxBool editVisible = true.obs;

  @override
  void onInit() {
    super.onInit();

    // set template size
    width.value = double.parse(Get.parameters['width'] ?? '1200.00');
    height.value = double.parse(Get.parameters['height'] ?? '1200.00');

    ratio.value = Get.parameters['ratio'] ?? '1:1';

    // set default text
    textController.text = text.value;
  }

  // calculate canvas size
  // based on screen size and ratio
  Size calculateCanvasSize(
    double scwidth,
    double scheight,
  ) {
    double w = scwidth;
    double h = scheight;

    final ratioValue = ratio.value.split(':');
    final widthRatio = double.parse(ratioValue[0]);
    final heightRatio = double.parse(ratioValue[1]);

    log('calculate size');
    log('wRatio=$widthRatio,hRatio=$heightRatio');

    w = scheight * (widthRatio / heightRatio);
    h = scwidth / (widthRatio / heightRatio);

    canvasSize.value = Size(w, h);

    return Size((w), (h));
  }

  void textToggleBold() {
    isBold.value = !isBold.value;
    update();
  }

  void textToggleItalic() {
    isItalic.value = !isItalic.value;
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

      Get.find<SelectColorController>().updatePallete(file: File(xfiles.path));
      update();
    }
  }

  setFontColor(Color color) {
    fontColor.value = color;
    update();
    Get.backLegacy();
  }

  setBackgroundColor(Color color) {
    backgroundColor.value = color;
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
          // refresh lobrary
          final homeController = Get.find<HomeController>();
          homeController.loadFiles();
        });
      } else {
        showGetXSnackBar(title: 'Error', message: 'Cannot capture image');
      }
    } catch (e) {
      showGetXSnackBar(title: 'Error', message: 'Cannot export scaled  image');
    }
  }

  Future<File> saveImageToFile(ui.Image image) async {
    final Uint8List bytes = await convertImageToBytes(image);
    final directory = await getApplicationDocumentsDirectory();

    String exportFilename = 'sn${DateTime.now().millisecondsSinceEpoch}.png';

    // save to file
    final filePath = '${directory.path}/sn/$exportFilename';
    final file = File(filePath);
    await file.writeAsBytes(bytes);

    // save to gallery
    if (Platform.isAndroid || Platform.isIOS) {
      await ImageGallerySaverPlus.saveFile(filePath).then((v) {
        showGetXSnackBar(title: 'Saved', message: 'Save to gallery!');
      });
    } else {
      showGetXSnackBar(title: 'Saved', message: 'Save to document!');
    }

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
