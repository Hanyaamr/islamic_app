import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic_code/colors_theme.dart';
import 'package:islamic_code/providers/app_language_provider.dart';
import 'package:provider/provider.dart';

import '../providers/app_theme_provider.dart';

class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({super.key});

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppLanguageProvider>(context);
    var provider2 = Provider.of<AppThemeProvider>(context);
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
              onTap: () {
                provider.changeLanguage('en');
              },
              child: provider.appLanguage == 'en'
                  ? getSelectedItemWidget(AppLocalizations.of(context)!.english)
                  : getUnselectedItemWidget(
                      AppLocalizations.of(context)!.english)),
          Divider(
            color: provider2.isDarkMode()
                ? ColorsTheme.yellowDark
                : ColorsTheme.yellow,
          ),
          InkWell(
            onTap: () {
              provider.changeLanguage('ar');
            },
            child: provider.appLanguage == 'ar'
                ? getSelectedItemWidget(AppLocalizations.of(context)!.arabic)
                : getUnselectedItemWidget(AppLocalizations.of(context)!.arabic),
          ),
          Divider(
            color: provider2.isDarkMode()
                ? ColorsTheme.yellowDark
                : ColorsTheme.yellow,
          ),
        ],
      ),
    );
  }

  Widget getSelectedItemWidget(String text) {
    var provider = Provider.of<AppThemeProvider>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context)
              .textTheme.bodyMedium?.copyWith(
              color: provider.isDarkMode()
                  ? ColorsTheme.yellowDark
                  : ColorsTheme.yellow,
              fontSize: 25),
        ),
        Icon(
          Icons.check,
          color: provider.isDarkMode()
              ? ColorsTheme.yellowDark
              : ColorsTheme.yellow,
          size: 35,
        )
      ],
    );
  }

  Widget getUnselectedItemWidget(String text) {
    var provider = Provider.of<AppThemeProvider>(context);

    return Text(
      text,
      style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 15),
    );
  }
}
