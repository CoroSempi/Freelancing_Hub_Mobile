import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  bool get isDark => themeMode == ThemeMode.dark;
  static const String themeKey = 'theme_mode';
  Locale currentLocale;

  SettingsProvider({Locale? initialLocale})
      : currentLocale = initialLocale ?? const Locale('en') {
    loadSettings();
  }

  void changeTheme(ThemeMode selectedTheme) async {
    themeMode = selectedTheme;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      themeKey,
      selectedTheme == ThemeMode.dark ? 'dark' : 'light',
    );
  }

  Future<void> loadSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedTheme = prefs.getString(themeKey);
    themeMode = savedTheme == 'dark' ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  void changeLocale(Locale locale) {
    currentLocale = locale;
    notifyListeners();
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString('locale', locale.toLanguageTag());
    });
  }
}
