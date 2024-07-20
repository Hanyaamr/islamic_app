import 'package:flutter/material.dart';
import 'package:islamic_code/colors_theme.dart';

class MyThemeData {
  ///light , dark mode, colors(separated files)
  //const --> can know the value during compile time
  //file --> compile cannot know except during runtime
  static final ThemeData lightMode = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        unselectedIconTheme: IconThemeData(color: Colors.white),
        selectedItemColor: ColorsTheme.blackColor,
        selectedLabelStyle: TextStyle(fontSize: 12)),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontSize: 30,
        color: ColorsTheme.blackColor,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(
        fontSize: 25,
        color: ColorsTheme.blackColor,
        fontWeight: FontWeight.w700,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        color: ColorsTheme.blackColor,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
  static final ThemeData darkMode = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: Colors.white),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        unselectedIconTheme: IconThemeData(color: Colors.white),
        selectedItemColor: ColorsTheme.yellowDark,
        selectedLabelStyle: TextStyle(fontSize: 12)),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontSize: 30,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(
        fontSize: 25,
        color: Colors.white,
        fontWeight: FontWeight.w700,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        color: ColorsTheme.blackColor,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
