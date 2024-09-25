import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ProjectContentView extends GetView {
  const ProjectContentView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProjectContentView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProjectContentView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
