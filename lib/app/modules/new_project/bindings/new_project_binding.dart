import 'package:get/get.dart';

import '../controllers/new_project_controller.dart';


class NewProjectBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<NewProjectController>(
        () => NewProjectController(),
      )
    ];
  }
}



// class NewProjectBinding extends Bindings {
//   @override
//   void dependencies() {
//     Get.lazyPut<NewProjectController>(
//       () => NewProjectController(),
//     );
//   }
// }


