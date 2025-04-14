import 'package:flutter/material.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class MainMenu {
  String title;
  IconData icon;
  MainMenu({
    required this.title,
    required this.icon,
  });
}

final mainMenu = <MainMenu>[
  MainMenu(title: 'Template', icon: Icons.description_outlined),
  MainMenu(title: 'Library', icon: Icons.folder_open),
  MainMenu(title: 'Gallery', icon: Icons.image_outlined),
  MainMenu(title: 'Settings', icon: Icons.account_circle_outlined),
];
