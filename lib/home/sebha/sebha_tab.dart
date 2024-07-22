import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic_code/colors_theme.dart';
import 'package:islamic_code/providers/app_theme_provider.dart';
import 'package:provider/provider.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  double turnRotate = 0.0;
  List<String> azkaar = ['Subhan Allah', 'El hamdullah', 'Allah Akbr'];
  int azkaarIndex = 0;

  void incrementCounter() {
    setState(() {
      counter++;
      turnRotate += 1 / 8;
      if (counter == 34) {
        counter = 0;
        azkaarIndex = (azkaarIndex + 1) % azkaar.length;
        //change azkaar text azkaar[i++] until i=2 and redo from azkaar [0]
        return;
      } else {
        return;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppThemeProvider>(context);

    List<String> azkaar = [
      AppLocalizations.of(context)!.subhan_allah,
      AppLocalizations.of(context)!.elhamdullah,
      AppLocalizations.of(context)!.allah_akbr,
    ];

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              provider.isDarkMode()
                  ? Image.asset(
                      'assets/images/head_sebha_dark.png',
                      alignment: AlignmentDirectional.center,
                    )
                  : Image.asset(
                      'assets/images/head_sebha_logo.png',
                      alignment: AlignmentDirectional.center,
                    ),
              Padding(
                padding: const EdgeInsets.only(top: 76.0),
                child: AnimatedRotation(
                  duration: Duration(seconds: 1),
                  turns: turnRotate,
                  child: provider.isDarkMode()
                      ? Image.asset('assets/images/body_sebha_dark.png')
                      : Image.asset('assets/images/body_sebha_logo.png'),
                ),
              ),
            ],
          ),
          Text(
            AppLocalizations.of(context)!.tsbehat_number,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Container(
            padding: EdgeInsets.all(25),
            decoration: BoxDecoration(
                color: provider.isDarkMode()
                    ? ColorsTheme.blueDark
                    : Color.fromARGB(255, 199, 178, 149),
                borderRadius: BorderRadius.circular(30)),
            child: Text(
              '$counter',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: provider.isDarkMode()
                    ? ColorsTheme.yellowDark
                    : ColorsTheme.yellow,
                borderRadius: BorderRadius.circular(60)),
            child: InkWell(
              onTap: () {
                incrementCounter();
              },
              child: Text(azkaar[azkaarIndex],
                  style: TextStyle(
                      color: provider.isDarkMode()
                          ? ColorsTheme.blueDark
                          : Colors.white,
                      fontWeight: FontWeight.bold)),
            ),
          )
        ],
      ),
    );
  }
}
