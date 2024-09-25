import 'package:flutter/material.dart';

import 'package:get/get.dart';

class TemplateContentView extends GetView {
  const TemplateContentView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'TemplateContentView is working',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
