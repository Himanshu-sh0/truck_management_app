import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_sizes.dart';
part 'light_theme.dart';
part 'dark_theme.dart';

class ThemeConfig {
  ThemeConfig._();

  static ThemeData get lightTheme => LightTheme.theme;
  static ThemeData get darkTheme => DarkTheme.theme;

  static ThemeData get currentTheme =>
      _isDarkModeEnabled ? darkTheme : lightTheme;
  static bool _isDarkModeEnabled = false;

  static void switchTheme(bool isDarkModeEnabled) {
    _isDarkModeEnabled = isDarkModeEnabled;
  }
}
