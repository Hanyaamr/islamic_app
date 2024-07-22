import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic_code/colors_theme.dart';
import 'package:islamic_code/home/hadeth/hadeth.dart';
import 'package:islamic_code/home/hadeth/item_hadeth_details.dart';
import 'package:islamic_code/providers/app_theme_provider.dart';
import 'package:provider/provider.dart';

class HadethDetails extends StatefulWidget {
  static const String routeName = 'hadethDetails';

  const HadethDetails({super.key});

  @override
  State<HadethDetails> createState() => _HadethDetailsState();
}

class _HadethDetailsState extends State<HadethDetails> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppThemeProvider>(context);

    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;

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
        body: Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * .07,
              horizontal: MediaQuery.of(context).size.width * 0.05,
            ),
            decoration: BoxDecoration(
                color: provider.isDarkMode()
                    ? ColorsTheme.blueDark
                    : Color.fromRGBO(248, 248, 248, .5),
                borderRadius: BorderRadius.circular(40)),
            child: Column(
              children: [
                Expanded(
                  child: Text(args.title),
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
                      return ItemHadethDetails(content: args.content[index]);
                    },
                    itemCount: args.content.length,
                  ),
                ),
              ],
            )),
      ),
    ]);
  }
}

// void loadFile(int index) async {
// String content =await rootBundle.loadString('assets/files/${index+1}.txt');
// List<String> lines = content.split('\n');
// for(int i=0;i<lines.length;i++){
//   print(lines[i]);
// }
// verses=lines;
// setState(() {
//
// });
// }
// }
//
//
//
//
//
//
// class SuraDetailsArgs{
//   String name;
//   int index;
//   SuraDetailsArgs({required this.name, required this.index});
// }
