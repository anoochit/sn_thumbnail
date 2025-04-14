import 'package:get/get.dart';

import 'package:sn_thumbnail/app/modules/new_project/controllers/dragable_contreoller.dart';
import 'package:sn_thumbnail/app/modules/new_project/controllers/genaibox_controller.dart';
import 'package:sn_thumbnail/app/modules/new_project/controllers/select_color_controller.dart';

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
      ),
      Bind.lazyPut<GenAIBoxController>(
        () => GenAIBoxController(),
      ),
      Bind.lazyPut<SelectColorController>(
        () => SelectColorController(),
      )
    ];
  }
}
