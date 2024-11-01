import 'package:flutter/material.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class SettingsMenu {
  IconData icon;
  String title;
  String key;
  SettingsMenu({
    required this.icon,
    required this.title,
    required this.key,
  });
}

final settingsMenu = <SettingsMenu>[
  SettingsMenu(
    icon: Icons.lock_open,
    title: 'Gemini API Key',
    key: 'GEMINI_API_KEY',
  ),
  SettingsMenu(
    icon: Icons.lock_open,
    title: 'Stability API Key',
    key: 'STABILITY_API_KEY',
  ),
];
