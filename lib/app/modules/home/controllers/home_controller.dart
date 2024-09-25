import 'package:get/get.dart';

class HomeController extends GetxController {
  // navigation index
  final navIndex = 0.obs;

  // // profile preferences
  // late Rx<Preference> preference;

  // // image data
  // RxList<ImageGen> imageGenList = <ImageGen>[].obs;

  // // project data
  // RxList<Project> projectList = <Project>[].obs;

  // // text data
  // RxList<TextGen> textGenList = <TextGen>[].obs;

  // check profile data
  RxString geminiAPIKey = ''.obs;
  RxString stabilityAPIKey = ''.obs;

  // init
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    loadData();
  }

  // load data
  loadData() {
    // preference
    // loadPreference();

    // image

    // project

    // text
  }

  // Future<void> loadPreference() async {
  //   //
  //   final data = await isar.preferences.where().findAll();
  //   final total = data.length;
  //   if (total > 0) {
  //     geminiAPIKey.value = data.first.geminiAPIKey ?? '';
  //     stabilityAPIKey.value = data.first.stabilityAPIKey ?? '';
  //   } else {
  //     setPreference(geminiKey: '', stabilityKey: '');
  //   }
  // }

  // Future<void> setPreference(
  //     {required String geminiKey, required String stabilityKey}) async {
  //   // row data
  //   final row = Preference()
  //     ..id = 1
  //     ..geminiAPIKey = geminiKey
  //     ..stabilityAPIKey = stabilityKey;

  //   // write data
  //   isar.writeTxn(() async {
  //     isar.preferences.put(row);
  //   });

  //   // update rx
  //   geminiAPIKey.value = geminiKey;
  //   stabilityAPIKey.value = stabilityKey;
  // }
}
