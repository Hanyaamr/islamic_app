import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic_code/colors_theme.dart';
import 'package:islamic_code/home/hadeth/item_hadeth_name.dart';

class HadethTab extends StatefulWidget {
  static const String routeName = 'hadeth';

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth> HadethList = [];

  @override
  Widget build(BuildContext context) {
    if (HadethList.isEmpty) {
      loadHadethFile();
    }
    return Column(
      children: [
        Expanded(flex: 2, child: Image.asset('assets/images/hadeth_logo.png')),
        Divider(
          color: ColorsTheme.yellow,
          thickness: 4,
        ),
        Text(
          AppLocalizations.of(context)!.ahadeth,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Divider(
          color: ColorsTheme.yellow,
          thickness: 4,
        ),
        Expanded(
          flex: 5,
          child: HadethList.isEmpty
              ? Center(
                  child: CircularProgressIndicator(
                    color: ColorsTheme.yellow,
                  ),
                )
              : ListView.separated(
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider(
                      height: 1,
                      color: ColorsTheme.yellow,
                      thickness: 3,
                    );
                  },
                  itemBuilder: (context, index) {
                    return ItemHadethName(hadeeeth: HadethList[index]);
                  },
                  itemCount: HadethList.length,
                ),
        )
      ],
    );
  }

  void loadHadethFile() async {
    String hadethContent =
        await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> hadethList = hadethContent.split('#\r\n');
    for (int i = 0; i < hadethList.length; i++) {
      List<String> hadethLines = hadethList[i].split('\n');
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      Hadeth hadeth = Hadeth(title: title, content: hadethLines);
      HadethList.add(hadeth);
      setState(() {});
    }
  }
}

class Hadeth {
  String title;

  List<String> content;

  Hadeth({required this.title, required this.content});
}
