import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

import '../../../controllers/app_controller.dart';
import '../../../services/snackbar.dart';

class HomeController extends GetxController {
  // navigation index
  final navIndex = 0.obs;

  RxList<String> listFiles = <String>[].obs;

  RxList<String> listGallery = <String>[].obs;
  RxList<String> listLibrary = <String>[].obs;

  // init
  @override
  void onInit() {
    //
    super.onInit();

    // load files
    loadFiles();
  }

  // load file from directory
  Future<void> loadFiles() async {
    log('load files');
    listGallery.clear();
    listLibrary.clear();
    final directory = await getApplicationDocumentsDirectory();
    await Directory('${directory.path}/sn/').create();

    Directory('${directory.path}/sn/')
        .list()
        .asBroadcastStream()
        .listen((file) {
      if (file.path.contains(RegExp(r"sn\d+"))) {
        listLibrary.add(file.path);
      } else {
        listGallery.add(file.path);
      }
    });
  }

  checkAPIKey() {
    final appController = Get.find<AppController>();
    if (appController.geminiAPIKey.value.isEmpty ||
        appController.stabilityAPIKey.value.isEmpty) {
      showGetXSnackBar(
        title: 'No API Key',
        message: 'No API Key, config your API Key in settings menu',
      );
    }
  }
}
