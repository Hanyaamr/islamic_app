import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLanguageProvider extends ChangeNotifier {
  // data
  String appLanguage = 'en'; // any language for safety

  void changeLanguage(String newLanguage) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('app_language', newLanguage);
    if (appLanguage == newLanguage) {
      return;
    }
    appLanguage = newLanguage;
    notifyListeners();
  }

  Future<void> initialize() async {
    final prefs = await SharedPreferences.getInstance();
    final savedLanguage = prefs.getString('app_language');
    if (savedLanguage != null) {
      appLanguage = savedLanguage;
    }
    notifyListeners();
  }

  AppLanguageProvider() {
    initialize(); // Call initialize in the constructor
  }
}