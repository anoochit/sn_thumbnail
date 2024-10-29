// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MainMenu {
  String title;
  IconData icon;
  MainMenu({
    required this.title,
    required this.icon,
  });
}

final mainMenu = <MainMenu>[
  MainMenu(title: 'Library', icon: Icons.image),
  MainMenu(title: 'Template', icon: Icons.description),
  MainMenu(title: 'Settings', icon: Icons.account_circle),
];
