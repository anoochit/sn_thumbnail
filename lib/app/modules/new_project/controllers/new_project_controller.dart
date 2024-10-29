import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class NewProjectController extends GetxController {
  RxDouble width = 1200.00.obs;
  RxDouble height = 1200.00.obs;

  RxDouble localWidth = 200.00.obs;
  RxDouble localHeight = 200.00.obs;

  TextEditingController textController = TextEditingController();

  late TextStyle textStyle;

  @override
  void onInit() {
    super.onInit();

    // set template size
    width.value = double.parse(Get.parameters['width'] ?? '1200.00');
    height.value = double.parse(Get.parameters['height'] ?? '1200.00');

    // set default text
    textController.text = 'Example Text';

    // text style
    textStyle = GoogleFonts.kanit(fontSize: 50.0, height: 0.98);
  }

  Size calculateLocalSize(double scwidth, double scheight) {
    double w = scwidth;
    double h = scwidth;

    if (scwidth < scheight) {
      w = scwidth;
      h = scwidth;
    } else if (scwidth > scheight) {
      w = scheight;
      h = scheight;
    }

    return Size((w), (h));
  }
}
