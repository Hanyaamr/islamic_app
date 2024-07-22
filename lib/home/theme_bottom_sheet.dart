import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic_code/colors_theme.dart';
import 'package:islamic_code/providers/app_theme_provider.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatefulWidget {
  const ThemeBottomSheet({super.key});

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppThemeProvider>(context);
    var provider2 = Provider.of<AppThemeProvider>(context);
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
              onTap: () {
                provider.changeTheme(ThemeMode.light);
              },
              child: provider.appTheme == ThemeMode.light
                  ? getSelectedItemWidget(AppLocalizations.of(context)!.light)
                  : getUnselectedItemWidget(
                      AppLocalizations.of(context)!.light)),
          Divider(
            color: provider2.isDarkMode()
                ? ColorsTheme.yellowDark
                : ColorsTheme.yellow,
          ),
          InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.dark);
            },
            child: provider.appTheme == ThemeMode.dark
                ? getSelectedItemWidget(AppLocalizations.of(context)!.dark)
                : getUnselectedItemWidget(AppLocalizations.of(context)!.dark),
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
              .textTheme
              .bodyMedium?.copyWith(
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
    return Text(
      text,
      style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 15),
    );
  }
}
