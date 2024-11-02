import 'dart:io';

import 'package:flutter/material.dart';

import 'package:bitsdojo_window/bitsdojo_window.dart';

initWindows() {
  // check desktop platform to config windows size
  // TODO : check another desktop eg: linux, macos
  if (Platform.isWindows) {
    doWhenWindowReady(() {
      const initialSize = Size(540, 920);
      const minSize = initialSize;
      appWindow.minSize = minSize;
      appWindow.size = initialSize;
      appWindow.show();
      appWindow.maximize();
    });
  }
}
