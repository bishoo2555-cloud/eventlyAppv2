import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppThemeProvider extends ChangeNotifier {
  ThemeMode _appTheme = ThemeMode.light;
  static const String _themeKey = 'app_theme';

  ThemeMode get appTheme => _appTheme;

  AppThemeProvider() {
    _loadTheme();
  }

  void _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final themeString = prefs.getString(_themeKey) ?? 'light';
    _appTheme = _getThemeModeFromString(themeString);
    notifyListeners();
  }

  ThemeMode _getThemeModeFromString(String themeString) {
    switch (themeString) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      case 'system':
        return ThemeMode.system;
      default:
        return ThemeMode.light;
    }
  }

  String _getStringFromThemeMode(ThemeMode themeMode) {
    switch (themeMode) {
      case ThemeMode.light:
        return 'light';
      case ThemeMode.dark:
        return 'dark';
      case ThemeMode.system:
        return 'system';
    }
  }

  void changeTheme(ThemeMode newTheme) async {
    if (_appTheme == newTheme) {
      return;
    }
    _appTheme = newTheme;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themeKey, _getStringFromThemeMode(newTheme));

    notifyListeners();
  }

  void toggleTheme() {
    if (_appTheme == ThemeMode.light) {
      changeTheme(ThemeMode.dark);
    } else {
      changeTheme(ThemeMode.light);
    }
  }

  bool get isDarkMode => _appTheme == ThemeMode.dark;
}
