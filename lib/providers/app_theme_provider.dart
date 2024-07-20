import 'package:flutter/material.dart';

class AppThemeProvider extends ChangeNotifier {
//data
  ThemeMode appTheme = ThemeMode.light;

  void changeTheme(ThemeMode newMode) {
    if (appTheme == newMode) {
      return;
    }
    appTheme = newMode;
    notifyListeners();
  }

  bool isDarkMode() {
    return appTheme == ThemeMode.dark;
  }
}
