import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'gallery_content_view.dart';
import 'profile_content_view.dart';
import 'project_content_view.dart';
import 'template_content_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Social Network Thumbnail'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
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
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.folder),
              label: 'Project',
            ),
            NavigationDestination(
              icon: Icon(Icons.description),
              label: 'Template',
            ),
            NavigationDestination(
              icon: Icon(Icons.image),
              label: 'Library',
            ),
            NavigationDestination(
              icon: Icon(Icons.account_circle),
              label: 'Profile',
            ),
          ],
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
          ProjectContentView(),
          TemplateContentView(),
          GalleryContentView(),
          ProfileContentView(),
        ],
      ),
    );
  }

  Widget buildNavRails(BuildContext context) {
    return Obx(
      () => NavigationRail(
        backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
        extended: (context.width > 1200) ? true : false,
        destinations: const [
          NavigationRailDestination(
            icon: Icon(Icons.folder),
            label: Text('Project'),
          ),
          NavigationRailDestination(
            icon: Icon(Icons.description),
            label: Text('Template'),
          ),
          NavigationRailDestination(
            icon: Icon(Icons.image),
            label: Text('Library'),
          ),
          NavigationRailDestination(
            icon: Icon(Icons.account_circle),
            label: Text('Profile'),
          )
        ],
        selectedIndex: controller.navIndex.value,
        onDestinationSelected: (value) => controller.navIndex.value = value,
      ),
    );
  }
}
