import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic_code/home/hadeth/hadeth_details.dart';
import 'package:islamic_code/home/home_screen.dart';
import 'package:islamic_code/home/quran/surah_details.dart';
import 'package:islamic_code/home/settings.dart';
import 'package:islamic_code/my_theme_data.dart';
import 'package:islamic_code/providers/app_language_provider.dart';
import 'package:islamic_code/providers/app_theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => AppLanguageProvider()),
    ChangeNotifierProvider(create: (context) => AppThemeProvider())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.lightMode,
      themeMode: themeProvider.appTheme,
      darkTheme: MyThemeData.darkMode,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SurahDetails.routeName: (context) => SurahDetails(),
        HadethDetails.routeName: (context) => const HadethDetails(),
        Settings.routeName: (context) => const Settings(),
      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.appLanguage),
    );
  }
}
