import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppThemeProvider extends ChangeNotifier {
//data
  ThemeMode appTheme = ThemeMode.light;

  void changeTheme(ThemeMode newMode) async {
    SharedPreferences sharedPreferencesTheme =
        await SharedPreferences.getInstance();
    if (appTheme == newMode) {
      return;
    }
    appTheme = newMode;
    sharedPreferencesTheme.setString(
        'theme_mode', newMode.toString()); // Save theme mode as a string

    notifyListeners();
  }

  bool isDarkMode() {
    return appTheme == ThemeMode.dark;
  }

  Future<void> initialize() async {
    final prefs = await SharedPreferences.getInstance();
    final themeString = prefs.getString('theme_mode');
    if (themeString != null) {
      appTheme =
          ThemeMode.values.firstWhere((mode) => mode.toString() == themeString);
    }
    notifyListeners();
  }

  AppThemeProvider() {
    initialize(); // Call initialize in the constructor
  }
}
