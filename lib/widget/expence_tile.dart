import 'package:expense_track/models/expence.dart';
import 'package:flutter/material.dart';

class ExpenceTile extends StatelessWidget {
  const ExpenceTile({Key? key, required this.expence}) : super(key: key);

  final ExpenceModel expence;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              expence.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  expence.amount.toStringAsFixed(2),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Spacer(),
                Icon(
                  categoryIcons[expence.category],
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  expence.getFormatedData,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
