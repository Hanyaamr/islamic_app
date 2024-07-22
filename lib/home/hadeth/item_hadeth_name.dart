import 'package:flutter/material.dart';
import 'package:islamic_code/home/hadeth/hadeth.dart';
import 'package:islamic_code/home/hadeth/hadeth_details.dart';

class ItemHadethName extends StatelessWidget {
  Hadeth hadeeeth;

  ItemHadethName({required this.hadeeeth});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(HadethDetails.routeName, arguments: hadeeeth);
      },
      child: Text(
        hadeeeth.title,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
