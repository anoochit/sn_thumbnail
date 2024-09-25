import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ProfileContentView extends GetView {
  const ProfileContentView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfileContentView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProfileContentView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
