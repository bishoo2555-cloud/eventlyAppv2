import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLanguageProvider extends ChangeNotifier {
  String _appLanguage = "en";
  static const String _languageKey = 'app_language';

  String get appLanguage => _appLanguage;

  AppLanguageProvider() {
    _loadLanguage();
  }

  void _loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    _appLanguage = prefs.getString(_languageKey) ?? "en";
    notifyListeners();
  }

  void changeLanguage(String newLanguage) async {
    if (_appLanguage == newLanguage) {
      return;
    }
    _appLanguage = newLanguage;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageKey, newLanguage);

    notifyListeners();
  }
}
