import 'package:flutter/material.dart';
import '../config/app_config.dart';

class AppTheme {
  static ThemeData light(AppConfig config) {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: config.primary,
      colorScheme: ColorScheme.light(
        primary: config.primary,
        secondary: config.secondary,
      ),
    );
  }

  static ThemeData dark(AppConfig config) {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: config.primary,
      colorScheme: ColorScheme.dark(
        primary: config.primary,
        secondary: config.secondary,
      ),
    );
  }
}
