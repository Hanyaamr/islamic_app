import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic_code/colors_theme.dart';
import 'package:islamic_code/home/quran/item_surah_details.dart';
import 'package:provider/provider.dart';

import '../../providers/app_theme_provider.dart';

class SurahDetails extends StatefulWidget {
  static const String routeName = 'surah_details';

  @override
  State<SurahDetails> createState() => _SurahDetailsState();
}

class _SurahDetailsState extends State<SurahDetails> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    var provider = Provider.of<AppThemeProvider>(context);

    if (verses.isEmpty) {
      loadFile(args.index);
    }

    return Stack(children: [
      provider.isDarkMode()
          ? Image.asset(
              'assets/images/dark_bg.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            )
          : Image.asset(
              'assets/images/default_bg.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            AppLocalizations.of(context)!.app_title,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        body: verses.isEmpty
            ? Center(
                child: CircularProgressIndicator(
                  color: provider.isDarkMode()
                      ? ColorsTheme.yellowDark
                      : ColorsTheme.yellow,
                ),
              )
            : Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * .07,
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                ),
                decoration: BoxDecoration(
                    color: provider.isDarkMode()
                        ? Color.fromRGBO(20, 28, 46, 0.5803921568627451)
                        : Color.fromRGBO(248, 248, 248, .5),
                    borderRadius: BorderRadius.circular(40)),
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.play_circle_sharp,
                              size: 30,
                            ),
                            color: provider.isDarkMode()
                                ? ColorsTheme.yellowDark
                                : Colors.black,
                          ),

                          Text(
                            ' سورة ${args.name}',
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: provider.isDarkMode()
                                          ? ColorsTheme.yellowDark
                                          : Colors.black,
                                    ),
                          ),
                          // (args.name),
                        ],
                      ),
                    ),
                    Container(
                      height: 1, // Adjust height as needed
                      color: provider.isDarkMode()
                          ? ColorsTheme.yellowDark
                          : ColorsTheme.yellow, // Adjust color as needed
                      width: 270, // Adjust width for a thin line
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .04,
                    ),
                    Expanded(
                      flex: 9,
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return ItemSurahDetails(
                            content: verses[index],
                            index: index,
                          );
                        },
                        itemCount: verses.length,
                      ),
                    ),
                  ],
                )),
      ),
    ]);
  }

  void loadFile(int index) async {
    String content =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = content.split('\n');
    for (int i = 0; i < lines.length; i++) {
      print(lines[i]);
    }
    verses = lines;
    setState(() {});
  }
}

class SuraDetailsArgs {
  String name;
  int index;

  SuraDetailsArgs({required this.name, required this.index});
}
