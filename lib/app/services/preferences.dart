import 'dart:developer';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:sn_thumbnail/app/controllers/app_controller.dart';
import 'package:sn_thumbnail/app/data/settings_menu.dart';

late SharedPreferences prefs;
late AppController appController;

initPreferences() async {
  // init
  appController = Get.put(AppController(), permanent: true);
  prefs = await SharedPreferences.getInstance();
  // load preference
  loadPreferences();
}

loadPreferences() {
  // load gemini key
  appController.geminiAPIKey.value = prefs.getString(settingsMenu[0].key) ?? '';
  // load stability key
  appController.stabilityAPIKey.value =
      prefs.getString(settingsMenu[1].key) ?? '';
}

Future<bool> savePreference(
    {required String key, required String value}) async {
  if (key.contains('GEMINI')) {
    log('save gemini key');
    appController.geminiAPIKey.value = value;
  } else {
    log('save stability key');
    appController.stabilityAPIKey.value = value;
  }
  return await prefs.setString(key, value);
}
