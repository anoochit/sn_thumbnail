import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app/routes/app_pages.dart';
import 'app/services/preferences.dart';
import 'app/services/windows.dart';

// import 'app/services/isar.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // init preference
  await initPreferences();

  // init isar
  // await initIsar();

  // run app
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Social Network Thumbnail",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        brightness: Brightness.light,
        colorSchemeSeed: Colors.deepPurple,
        textTheme: TextTheme(displayLarge: GoogleFonts.kanit()),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.deepPurple,
        textTheme: TextTheme(displayLarge: GoogleFonts.kanit()),
      ),
    ),
  );

  // windows config
  initWindows();
}
