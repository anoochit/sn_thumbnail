import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

import 'package:sn_thumbnail/app/routes/app_pages.dart';

import '../../../../data/project_canvas.dart';
import '../../../../services/gridview.dart';

class TemplateBodyView extends GetView {
  const TemplateBodyView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Template'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return GridView.builder(
          itemCount: listCanvas.length,
          padding: const EdgeInsets.all(8.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: GridUtils.responsiveGridColumn(context.width)),
          itemBuilder: (context, index) {
            final item = listCanvas[index];
            final title = item.title;
            final width = item.width;
            final height = item.height;
            final ratio = item.ratio;
            final icon = item.icon;
            return Card(
              elevation: 0.0,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: InkWell(
                onTap: () {
                  Get.toNamed(Routes.NEW_PROJECT, parameters: {
                    'scWidth': '${constraints.maxWidth}',
                    'scHeight': '${constraints.maxHeight}',
                    'width': '$width',
                    'height': '$height',
                    'ratio': ratio
                  });
                },
                child: GridTile(
                  footer: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(title),
                    ),
                  ),
                  child: Center(
                    child: Iconify(
                      icon,
                      size: 64.0,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
