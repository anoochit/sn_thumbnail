import 'package:get/get.dart';

import '../controllers/view_image_controller.dart';

class ViewImageBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<ViewImageController>(
        () => ViewImageController(),
      )
    ];
  }
}
