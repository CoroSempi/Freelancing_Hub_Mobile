import 'package:flutter/material.dart';
import 'package:iti_freelancing_hub/core/utils/them_helper.dart';

class SettingsProvider with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  bool get isDark => themeMode == ThemeMode.dark;

  Future<void> loadThemeMode() async {
    themeMode = await ThemeHelper.loadTheme();
    notifyListeners();
  }

  Future<void> changeTheme(ThemeMode selectedTheme) async {
    themeMode = selectedTheme;
    notifyListeners();
    await ThemeHelper.saveTheme(selectedTheme == ThemeMode.dark);
  }
}