import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic_code/colors_theme.dart';

class MyThemeData {

  ///light , dark mode,
  /// colors(separated files)
  //const --> can know the value during compile time
  //final --> compile cannot know except during runtime
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
        bodyMedium: GoogleFonts.elMessiri(
          // surah name,ez3t el qur'an , no.tsbee7at, el a7adeth title
          fontSize: 25,
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),

        bodySmall: GoogleFonts.inter(
          //verses no, surah names in details,a7adeth title in tab, hadeth title
          fontSize: 25,
          color: Colors.black,
          fontWeight: FontWeight.w300,
        ),

        //hadeth info , verses
        titleLarge: TextStyle(
          fontSize: 20,
          color: Colors.black,
          fontWeight: FontWeight.w400,
        ),
      ));
  static final ThemeData darkMode = ThemeData(
    bottomSheetTheme:
        BottomSheetThemeData(backgroundColor: ColorsTheme.blueDark),
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
      //islami title
      bodyLarge: GoogleFonts.elMessiri(
        fontSize: 30,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),

      bodyMedium: GoogleFonts.elMessiri(
        // surah name,ez3t el qur'an , no.tsbee7at, el a7adeth title
        fontSize: 25,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),

      bodySmall: GoogleFonts.inter(
        //verses no, surah names in details,a7adeth title in tab, hadeth title
        fontSize: 25,
        color: Colors.white,
        fontWeight: FontWeight.w300,
      ),

      //hadeth info , verses
      titleLarge: TextStyle(
        fontSize: 20,
        color: ColorsTheme.yellowDark,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
