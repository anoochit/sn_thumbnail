import 'package:get/get.dart';

import 'package:sn_thumbnail/app/modules/new_project/controllers/dragable_contreoller.dart';

import '../controllers/new_project_controller.dart';

class NewProjectBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<NewProjectController>(
        () => NewProjectController(),
      ),
      Bind.lazyPut<DraggableController>(
        () => DraggableController(),
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
