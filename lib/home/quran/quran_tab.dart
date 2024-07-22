import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic_code/colors_theme.dart';
import 'package:islamic_code/home/quran/surah_details.dart';
import 'package:provider/provider.dart';

import '../../providers/app_theme_provider.dart';

class QuranTab extends StatelessWidget {
  List<String> suraNames = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];

  List<String> versesNumber = [
    '7',
    '286',
    '200',
    '176',
    '120',
    '165',
    '206',
    '75',
    '129',
    '109',
    '123',
    '111',
    '43',
    '52',
    '99',
    '128',
    '111',
    '110',
    '98',
    '135',
    '112',
    '78',
    '118',
    '64',
    '77',
    '227',
    '93',
    '88',
    '69',
    '60',
    '34',
    '30',
    '73',
    '54',
    '45',
    '83',
    '182',
    '88',
    '75',
    '85',
    '54',
    '53',
    '89',
    '59',
    '37',
    '35',
    '38',
    '29',
    '18',
    '45',
    '60',
    '49',
    '62',
    '55',
    '78',
    '96',
    '29',
    '22',
    '24',
    '13',
    '14',
    '11',
    '11',
    '18',
    '12',
    '12',
    '30',
    '52',
    '52',
    '44',
    '28',
    '28',
    '20',
    '56',
    '40',
    '31',
    '50',
    '40',
    '46',
    '42',
    '29',
    '19',
    '36',
    '25',
    '22',
    '17',
    '19',
    '26',
    '30',
    '20',
    '15',
    '21',
    '11',
    '8',
    '5',
    '19',
    '5',
    '8',
    '8',
    '11',
    '11',
    '8',
    '3',
    '9',
    '5',
    '4',
    '6',
    '3',
    '6',
    '3',
    '5',
    '4',
    '5',
    '6'
  ];

  //Map<String, int> suraData = Map.fromIterables(suraNames, versesNumber);
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppThemeProvider>(context);

    return Column(
      children: [
        Expanded(
            flex: 2,
            child: Image.asset('assets/images/qur2an_screen_logo.png')),
        // Divider(
        //   color: provider.isDarkMode()
        //       ? ColorsTheme.yellowDark
        //       : ColorsTheme.yellow,
        //   thickness: 4,
        // ),

        Container(
          color: provider.isDarkMode()
              ? ColorsTheme.yellowDark
              : ColorsTheme.yellow,
          height: MediaQuery.of(context).size.height * .008,
          width: MediaQuery.of(context).size.width,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Text(
                AppLocalizations.of(context)!.surah_name,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              child: VerticalDivider(
                thickness: 5,
                color: provider.isDarkMode()
                    ? ColorsTheme.yellowDark
                    : ColorsTheme.yellow,
              ),
              height: 50,
            ),
            Expanded(
              child: Text(
                AppLocalizations.of(context)!.versus_number,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        // Divider(
        //   color: provider.isDarkMode()
        //       ? ColorsTheme.yellowDark
        //       : ColorsTheme.yellow,
        //   thickness: 4,
        // ),
        Container(
          color: provider.isDarkMode()
              ? ColorsTheme.yellowDark
              : ColorsTheme.yellow,
          height: MediaQuery.of(context).size.height * .008,
          width: MediaQuery.of(context).size.width,
        ),
        Expanded(
          flex: 5,
          child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) {
              return Container(
                color: provider.isDarkMode()
                    ? ColorsTheme.yellowDark
                    : ColorsTheme.yellow,
                height: MediaQuery.of(context).size.height * .003,
                width: MediaQuery.of(context).size.width,
              );
              //   Divider(
              //   height: 2,
              //   color: provider.isDarkMode()
              //       ? ColorsTheme.yellowDark
              //       : ColorsTheme.yellow,
              //   thickness: 1,
              // );
            },
            itemCount: suraNames.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () => Navigator.of(context).pushNamed(
                        SurahDetails.routeName,
                        arguments: SuraDetailsArgs(
                            name: suraNames[index], index: index),
                      ),
                      child: Text(
                        ' ${suraNames[index]}',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: 50,
                  //
                  //   child: VerticalDivider(
                  //     thickness: 5,
                  //     color: provider.isDarkMode()
                  //         ? ColorsTheme.yellowDark
                  //         : ColorsTheme.yellow,
                  //   ),
                  // ),
                  Container(
                    color: provider.isDarkMode()
                        ? ColorsTheme.yellowDark
                        : ColorsTheme.yellow,
                    height: MediaQuery.of(context).size.height * .05,
                    width: MediaQuery.of(context).size.width * .009,
                  ),
                  Expanded(
                      child: Text(versesNumber[index],
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodySmall)),
                ],
              );
            },
          ),
        )
      ],
    );
  }
}
