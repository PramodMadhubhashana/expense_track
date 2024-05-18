import 'package:expense_track/models/expence.dart';
import 'package:expense_track/widget/expence_tile.dart';
import 'package:flutter/material.dart';

class ExpenceList extends StatelessWidget {
  final List<ExpenceModel> expenceList;
  final void Function(ExpenceModel exepence) onDeleteExpence;
  const ExpenceList(
      {Key? key, required this.expenceList, required this.onDeleteExpence})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: expenceList.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: ValueKey(
              expenceList[index],
            ),
            direction: DismissDirection.startToEnd,
            onDismissed: (direction) {
              onDeleteExpence(
                expenceList[index],
              );
            },
            child: ExpenceTile(
              expence: expenceList[index],
            ),
          );
        },
      ),
    );
  }
}
