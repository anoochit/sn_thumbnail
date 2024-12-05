import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

showGetXSnackBar({required String title, required String message}) {
  log('${Get.width}');
  Get.snackbar(
    title,
    message,
    margin: EdgeInsets.only(left: (Get.width > 640) ? (Get.width - 360) : 0.0),
  );
}
