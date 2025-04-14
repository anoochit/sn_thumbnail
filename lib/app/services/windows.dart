import 'dart:io';

import 'package:flutter/material.dart';

import 'package:bitsdojo_window/bitsdojo_window.dart';

initWindows() {
  // check desktop platform to config windows size
  if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
    appWindow.show();
    doWhenWindowReady(() {
      const initialSize = Size(1280, 720);
      appWindow.size = initialSize;
      appWindow.minSize = initialSize;
      appWindow.alignment = Alignment.topRight;

      appWindow.maximize();
    });
  }
}
