import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ProfileContentView extends GetView {
  const ProfileContentView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'ProfileContentView is working',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
