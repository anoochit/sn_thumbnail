import 'package:get/get.dart';

class DraggableController extends GetxController {
  RxDouble width = 400.0.obs;
  RxDouble height = 150.0.obs;
  RxDouble left = 10.0.obs;
  RxDouble top = 50.0.obs;
  RxBool visible = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void updatePosition(double deltaX, double deltaY) {
    left.value += deltaX;
    top.value += deltaY;
  }

  void updateSize(double deltaWidth, double deltaHeight) {
    width.value -= deltaWidth;
    height.value -= deltaHeight;
    left.value += deltaWidth;
    top.value += deltaHeight;
  }
}
