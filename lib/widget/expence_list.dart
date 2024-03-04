import 'package:expense_track/models/expence.dart';
import 'package:expense_track/widget/expence_tile.dart';
import 'package:flutter/material.dart';

class ExpenceList extends StatelessWidget {
  const ExpenceList({Key? key, required this.expenceList}) : super(key: key);

  final List<ExpenceModel> expenceList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: expenceList.length,
        itemBuilder: (context, index) {
          return ExpenceTile(
            expence: expenceList[index],
          );
        },
      ),
    );
  }
}
