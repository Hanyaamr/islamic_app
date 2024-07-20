import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic_code/colors_theme.dart';
import 'package:islamic_code/providers/app_theme_provider.dart';
import 'package:provider/provider.dart';

class RadioTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppThemeProvider>(context);
    return Column(
      children: [
        SizedBox(
          height: 150,
        ),
        Image.asset('assets/images/radio_image.png'),
        SizedBox(
          height: 50,
        ),
        Text(
          AppLocalizations.of(context)!.radio_quran,
          style: TextStyle(
              color:
                  provider.isDarkMode() ? Colors.white : ColorsTheme.blackColor,
              fontSize: 25),
        ),
        SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.skip_previous),
              iconSize: 35,
              color: provider.isDarkMode()
                  ? ColorsTheme.yellowDark
                  : ColorsTheme.yellow,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.play_arrow_rounded),
              iconSize: 50,
              color: provider.isDarkMode()
                  ? ColorsTheme.yellowDark
                  : ColorsTheme.yellow,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.skip_next),
              iconSize: 35,
              color: provider.isDarkMode()
                  ? ColorsTheme.yellowDark
                  : ColorsTheme.yellow,
            ),
          ],
        )
      ],
    );
  }
}
