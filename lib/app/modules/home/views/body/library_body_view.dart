import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:sn_thumbnail/app/services/gridview.dart';

class LibraryBodyView extends GetView {
  const LibraryBodyView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Library'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
      ),
      body: GridView.builder(
        itemCount: 10,
        padding: const EdgeInsets.all(8.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: GridUtils.responsiveGridColumn(context.width)),
        itemBuilder: (context, index) {
          return Card(
            elevation: 0.0,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: InkWell(
              onTap: () {
                //
              },
              child: const GridTile(
                footer: Center(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text('title'),
                  ),
                ),
                child: Center(),
              ),
            ),
          );
        },
      ),
    );
  }
}
