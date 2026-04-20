import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends ChangeNotifier {
  static const _key = 'isDarkMode';

  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;
  bool get isDark => _themeMode == ThemeMode.dark;

  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDarkSaved = prefs.getBool(_key);

    if (isDarkSaved != null) {
      _themeMode = isDarkSaved ? ThemeMode.dark : ThemeMode.light;
    }
  }

  Future<void> toggleTheme() async {
    _themeMode =
    _themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;

    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_key, isDark);
  }
}