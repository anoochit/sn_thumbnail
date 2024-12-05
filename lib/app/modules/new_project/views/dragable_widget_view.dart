import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/radix_icons.dart';

import '../controllers/dragable_contreoller.dart';

class DraggableWidgetView extends GetView<DraggableController> {
  const DraggableWidgetView({
    super.key,
    required this.child,
    // required this.visible,
  });
  final Widget child;
  // final bool visible;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        controller.updatePosition(details.delta.dx, details.delta.dy);
      },
      child: Obx(() => Stack(
            children: [
              Positioned(
                left: controller.left.value,
                top: controller.top.value,
                child: LongPressDraggable(
                  feedback: SizedBox(
                    width: controller.width.value,
                    height: controller.height.value,
                  ),
                  childWhenDragging: Container(),
                  onDragEnd: (details) {
                    controller.left.value = details.offset.dx;
                    controller.top.value = details.offset.dy;
                  },
                  child: MouseRegion(
                    cursor: SystemMouseCursors.move,
                    child: GestureDetector(
                      onTap: () {
                        log("on tap detected");
                        controller.visible.value = !controller.visible.value;
                      },
                      onLongPress: () {
                        log("Long press detected");
                        // You can add your desired functionality here
                      },
                      child: Container(
                        width: controller.width.value,
                        height: controller.height.value,
                        decoration: const BoxDecoration(
                            // color: Colors.blue,
                            ),
                        child: Stack(
                          children: [
                            SizedBox(
                              width: controller.width.value,
                              height: controller.height.value,
                              child: Center(child: child),
                            ),

                            // top left
                            Positioned(
                              left: 0,
                              top: 0,
                              child: GestureDetector(
                                onPanUpdate: (details) {
                                  controller.updateSize(
                                      details.delta.dx, details.delta.dy);
                                },
                                child: DraggableIconTopLeft(
                                  visible: controller.visible.value,
                                ),
                              ),
                            ),

                            // top right
                            Positioned(
                              right: 0,
                              top: 0,
                              child: GestureDetector(
                                onPanUpdate: (details) {
                                  controller.width.value += details.delta.dx;
                                  controller.height.value -= details.delta.dy;
                                  controller.top.value += details.delta.dy;
                                },
                                child: DraggableIconTopRight(
                                  visible: controller.visible.value,
                                ),
                              ),
                            ),

                            // bottom left
                            Positioned(
                              left: 0,
                              bottom: 0,
                              child: GestureDetector(
                                onPanUpdate: (details) {
                                  controller.width.value -= details.delta.dx;
                                  controller.height.value += details.delta.dy;
                                  controller.left.value += details.delta.dx;
                                },
                                child: DraggableIconBottomLeft(
                                  visible: controller.visible.value,
                                ),
                              ),
                            ),

                            // bottom right
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: GestureDetector(
                                onPanUpdate: (details) {
                                  controller.width.value += details.delta.dx;
                                  controller.height.value += details.delta.dy;
                                },
                                child: DraggableIconBottomRight(
                                  visible: controller.visible.value,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

class DraggableIconTopLeft extends StatelessWidget {
  const DraggableIconTopLeft({super.key, required this.visible});

  final bool visible;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: const Iconify(
        RadixIcons.corner_top_left,
        color: Colors.greenAccent,
        size: 36.0,
      ),
    );
  }
}

class DraggableIconTopRight extends StatelessWidget {
  const DraggableIconTopRight({super.key, required this.visible});

  final bool visible;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: const MouseRegion(
        cursor: SystemMouseCursors.resizeUpRight,
        child: Iconify(
          RadixIcons.corner_top_right,
          color: Colors.greenAccent,
          size: 36.0,
        ),
      ),
    );
  }
}

class DraggableIconBottomLeft extends StatelessWidget {
  const DraggableIconBottomLeft({super.key, required this.visible});

  final bool visible;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: const MouseRegion(
        cursor: SystemMouseCursors.resizeDownLeft,
        child: Iconify(
          RadixIcons.corner_bottom_left,
          color: Colors.greenAccent,
          size: 36.0,
        ),
      ),
    );
  }
}

class DraggableIconBottomRight extends StatelessWidget {
  const DraggableIconBottomRight({super.key, required this.visible});

  final bool visible;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: const MouseRegion(
        cursor: SystemMouseCursors.resizeDownRight,
        child: Iconify(
          RadixIcons.corner_bottom_right,
          color: Colors.greenAccent,
          size: 36.0,
        ),
      ),
    );
  }
}
