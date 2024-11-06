import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:path_provider/path_provider.dart';

import '../../../controllers/app_controller.dart';
import '../../../models/genimage.dart';
import '../../../models/gentitle.dart';
import '../../../services/gemini.dart';
import '../../../services/snackbar.dart';
import '../../../services/stability.dart';
import '../../home/controllers/home_controller.dart';
import 'new_project_controller.dart';
import 'select_color_controller.dart';

class GenAIBoxController extends GetxController {
  // app controller
  AppController appController = Get.find<AppController>();

  // text edit controller
  TextEditingController promptTextController = TextEditingController();

  // gen ai
  Rx<PromptType> genAiType = PromptType.title.obs;

  // gen content
  RxList<GenTitle> listGenTitle = <GenTitle>[].obs;
  RxList<GenImage> listGenImage = <GenImage>[].obs;

  // loading status
  RxBool isLoading = false.obs;

  // text to SEO title
  Future<void> generateTitle({required String prompt}) async {
    listGenTitle.clear();
    isLoading.value = true;

    final apiKey = appController.geminiAPIKey.value;

    try {
      final result = await GeminiService(apiKey: apiKey).generate(
        prompt: prompt,
        type: PromptType.title,
      );

      if (result.text != null) {
        final text = result.text!;
        if (isJsonResponse(text: text)) {
          final json = cleanJsonResponse(text: text);
          final genTitle = genTitleFromJson(json);
          listGenTitle.value = genTitle;
        }
      }
    } on GenerativeAIException catch (e) {
      showGetXSnackBar(title: 'Error', message: e.message);
    }

    isLoading.value = false;
  }

  bool isJsonResponse({required String text}) {
    return text.contains("```json");
  }

  String cleanJsonResponse({required String text}) {
    var result = text.replaceFirst('```json', '');
    result = result.replaceAll('```', '');
    return result;
  }

  // text to image
  Future<void> generateImage(
      {required String prompt,
      required String ratio,
      required int width,
      required int height}) async {
    // clear list
    listGenImage.clear();
    isLoading.value = true;

    final apiKey = appController.stabilityAPIKey.value;

    const totalImage = 2;

    final dir = await getApplicationDocumentsDirectory();

    // FIXME
    if ((ratio != "16:9") && (ratio != "9:16") && (ratio != "1:1")) {
      ratio = "3:2";
    }

    for (int i = 0; i < totalImage; i++) {
      final bytes = await StabilityService(apiKey: apiKey)
          .textToImage(prompt: prompt, ratio: ratio);

      // save to origial file
      final fileName =
          '${dir.path}/sn/ig${DateTime.now().microsecondsSinceEpoch}.png';
      await File(fileName).writeAsBytes(bytes);

      listGenImage.add(GenImage(image: fileName));

      showGetXSnackBar(title: 'Info', message: 'Save to $fileName');
    }

    final homeController = Get.find<HomeController>();
    homeController.loadFiles();

    isLoading.value = false;
  }

  void setTextToCanvas({required String title}) {
    final newProjectController = Get.find<NewProjectController>();
    newProjectController.text.value = title;
    newProjectController.textController.text = title;
    newProjectController.update();
  }

  Future<void> setImageToCanvas({required String path}) async {
    final newProjectController = Get.find<NewProjectController>();

    final byte = await File(path).readAsBytes();
    Get.find<SelectColorController>().updatePallete(file: File(path));
    newProjectController.backgroundImageData.value = byte;
    newProjectController.update();
  }
}
