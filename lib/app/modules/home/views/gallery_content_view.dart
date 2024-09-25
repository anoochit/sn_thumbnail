import 'package:flutter/material.dart';

import 'package:get/get.dart';

class GalleryContentView extends GetView {
  const GalleryContentView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GalleryContentView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'GalleryContentView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
