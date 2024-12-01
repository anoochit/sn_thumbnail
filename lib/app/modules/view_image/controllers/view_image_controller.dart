import 'dart:io';

import 'package:get/get.dart';
import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';

import '../../../services/snackbar.dart';

class ViewImageController extends GetxController {
  //
  RxString path = ''.obs;

  saveToGallery(String filePath) async {
    // save to gallery
    if (Platform.isAndroid || Platform.isIOS) {
      await ImageGallerySaverPlus.saveFile(filePath).then((v) {
        showGetXSnackBar(title: 'Saved', message: 'Save to gallery!');
      });
    } else {
      showGetXSnackBar(title: 'Saved', message: 'Save to document!');
    }
  }
}
