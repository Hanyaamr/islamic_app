import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic_code/colors_theme.dart';
import 'package:islamic_code/home/Language_bottom_sheet.dart';
import 'package:islamic_code/home/theme_bottom_sheet.dart';
import 'package:islamic_code/providers/app_language_provider.dart';
import 'package:provider/provider.dart';

import '../providers/app_theme_provider.dart';

class Settings extends StatefulWidget {
  static const String routeName = 'settings';

  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppLocalizations.of(context)!.language),
          Container(
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: themeProvider.isDarkMode()
                    ? Color.fromRGBO(51, 70, 112, 0.4196078431372549)
                    : Colors.white54,
                border: Border.all(
                  width: 3,
                  color: themeProvider.isDarkMode()
                      ? ColorsTheme.yellowDark
                      : ColorsTheme.yellow,
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(provider.appLanguage == 'en'
                    ? AppLocalizations.of(context)!.english
                    : AppLocalizations.of(context)!.arabic),
                IconButton(
                    onPressed: () {
                      showLanguageBottomSheet(context);
                    },
                  icon: Icon(Icons.expand_more_rounded),
                  color: themeProvider.isDarkMode()
                      ? ColorsTheme.yellowDark
                      : Colors.white54,
                )
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .05,
          ),
          Text(AppLocalizations.of(context)!.theme),
          Container(
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: themeProvider.isDarkMode()
                    ? Color.fromRGBO(51, 70, 112, 0.4196078431372549)
                    : Colors.white54,
                border: Border.all(
                  width: 3,
                  color: themeProvider.isDarkMode()
                      ? ColorsTheme.yellowDark
                      : ColorsTheme.yellow,
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(themeProvider.appTheme == ThemeMode.light
                    ? //light
                    AppLocalizations.of(context)!.light
                    : //light
                    AppLocalizations.of(context)!.dark), //dark
                IconButton(
                    onPressed: () {
                      showThemeBottomSheet();
                    },
                    icon: Icon(
                      Icons.expand_more_rounded,
                      color: themeProvider.isDarkMode()
                          ? ColorsTheme.yellowDark
                          : Colors.white54,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }

  void showLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context, builder: (context) => LanguageBottomSheet());
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
        context: context, builder: (context) => ThemeBottomSheet());
  }
}
