import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/main_menu.dart';
import '../controllers/home_controller.dart';
import 'body/library_body_view.dart';
import 'body/settings_body_view.dart';
import 'body/template_body_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildContent(context),
      bottomNavigationBar: buildBottomNavBar(context),
    );
  }

  Widget? buildBottomNavBar(BuildContext context) {
    // portait for mobile, tablet show nav menu
    if (context.width < 840) {
      return Obx(
        () => NavigationBar(
          selectedIndex: controller.navIndex.value,
          onDestinationSelected: (value) => controller.navIndex.value = value,
          destinations: List.generate(
            mainMenu.length,
            (i) {
              return NavigationDestination(
                icon: Icon(mainMenu[i].icon),
                label: mainMenu[i].title,
              );
            },
          ),
        ),
      );
    }

    return null;
  }

  Widget buildContent(BuildContext context) {
    if (context.width > 840) {
      return Flex(
        direction: Axis.horizontal,
        children: [
          // rails
          buildNavRails(context),

          // content
          Flexible(
            child: buildBodyContent(context),
          )
        ],
      );
    }

    return buildBodyContent(context);
  }

  Widget buildBodyContent(BuildContext context) {
    return Obx(
      () => IndexedStack(
        index: controller.navIndex.value,
        children: const [
          LibraryBodyView(),
          TemplateBodyView(),
          SettingsBodyView(),
        ],
      ),
    );
  }

  Widget buildNavRails(BuildContext context) {
    return Obx(
      () => NavigationRail(
        backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
        extended: (context.width > 1200) ? true : false,
        labelType: (context.width > 1200)
            ? NavigationRailLabelType.none
            : NavigationRailLabelType.all,
        destinations: List.generate(mainMenu.length, (i) {
          return NavigationRailDestination(
            icon: Icon(mainMenu[i].icon),
            label: Text(mainMenu[i].title),
          );
        }),
        selectedIndex: controller.navIndex.value,
        onDestinationSelected: (value) => controller.navIndex.value = value,
      ),
    );
  }
}
