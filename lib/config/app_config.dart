import 'package:flutter/material.dart';

class AppConfig {
  final String appName;
  final bool isDark;
  final Color primary;
  final Color secondary;
  final bool showAddButton;
  final bool showSearchBar;
  final List<Map<String, dynamic>> customButtons;

  AppConfig({
    required this.appName,
    required this.isDark,
    required this.primary,
    required this.secondary,
    required this.showAddButton,
    required this.showSearchBar,
    required this.customButtons,
  });

  factory AppConfig.fromJson(Map<String, dynamic> json) {
    Color hexToColor(String hex) =>
        Color(int.parse(hex.replaceFirst('#', '0xff')));

    return AppConfig(
      appName: json['appName'],
      isDark: json['theme']['mode'] == 'dark',
      primary: hexToColor(json['theme']['primaryColor']),
      secondary: hexToColor(json['theme']['secondaryColor']),
      showAddButton: json['components']['showAddButton'],
      showSearchBar: json['components']['showSearchBar'],
      customButtons:
      List<Map<String, dynamic>>.from(json['components']['customButtons']),
    );
  }
}
