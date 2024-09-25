import 'dart:developer';

import 'package:get/get.dart';
import 'package:realm/realm.dart';

import 'package:sn_thumbnail/app/data/models/schemas.dart';

import '../../../services/realm.dart';

class HomeController extends GetxController {
  // navigation index
  final navIndex = 0.obs;

  // preference
  Rx<Preference> preference = Preference(ObjectId(), '', '').obs;

  // image data
  RxList<ImageGen> listImageGen = <ImageGen>[].obs;

  // project data
  RxList<Project> listProject = <Project>[].obs;

  // text data
  RxList<TextGen> listTextGen = <TextGen>[].obs;

  // check profile data
  RxString geminiAPIKey = ''.obs;
  RxString stabilityAPIKey = ''.obs;

  // init
  @override
  void onInit() {
    // TODO : implement onInit
    super.onInit();

    loadData();
  }

  // load data
  loadData() {
    // preference
    loadPreference();

    // image
    loadImageLibrary();

    // project
    loadProject();

    // text
    loadTextGen();
  }

  Future<void> loadPreference() async {
    //
    final pref = realm.all<Preference>();

    if (pref.isEmpty) {
      log('set default preference');
      setPreference(geminiKey: '', stabilityKey: '');
    }

    pref.changes.listen((data) {
      log('load default preference');
      preference.value = pref.first;
      // update rx
      geminiAPIKey.value = pref.first.geminiAPIKey;
      stabilityAPIKey.value = pref.first.stabilityAPIKey;
    });
  }

  Future<void> setPreference(
      {required String geminiKey, required String stabilityKey}) async {
    // row data
    final row = Preference(
      ObjectId(),
      geminiKey,
      stabilityKey,
    );

    // write data
    realm.write(() {
      realm.add(row);
    });

    // update rx
    geminiAPIKey.value = geminiKey;
    stabilityAPIKey.value = stabilityKey;
  }

  void loadImageLibrary() {
    // load and listen change
    final images = realm.all<ImageGen>();
    images.changes.listen((data) {
      listImageGen.value = data.results.toList();
    });
  }

  void loadProject() {
    final projects = realm.all<Project>();
    projects.changes.listen((data) {
      listProject.value = data.results.toList();
    });
  }

  void loadTextGen() {
    final texts = realm.all<TextGen>();
    texts.changes.listen((data) {
      listTextGen.value = data.results.toList();
    });
  }
}
