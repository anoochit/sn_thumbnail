import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/new_project/bindings/new_project_binding.dart';
import '../modules/new_project/views/new_project_view.dart';
import '../modules/view_image/bindings/view_image_binding.dart';
import '../modules/view_image/views/view_image_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: _Paths.NEW_PROJECT,
      page: () => const NewProjectView(),
      binding: NewProjectBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: _Paths.VIEW_IMAGE,
      page: () => const ViewImageView(),
      binding: ViewImageBinding(),
      transition: Transition.cupertino,
    ),
  ];
}
