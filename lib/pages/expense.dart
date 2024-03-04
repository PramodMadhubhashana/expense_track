import 'package:expense_track/models/expence.dart';
import 'package:expense_track/widget/expence_list.dart';
import 'package:flutter/material.dart';

class Expense extends StatefulWidget {
  const Expense({Key? key}) : super(key: key);

  @override
  State<Expense> createState() => _ExpenseState();
}

class _ExpenseState extends State<Expense> {
  final List<ExpenceModel> _expenceList = [
    ExpenceModel(
      amount: 10.5,
      title: "foot ball",
      date: DateTime.now(),
      category: Category.leasure,
    ),
    ExpenceModel(
      amount: 25.5,
      title: "carrot",
      date: DateTime.now(),
      category: Category.food,
    ),
    ExpenceModel(
      amount: 61.2,
      title: "kandy",
      category: Category.travel,
      date: DateTime.now(),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense"),
        backgroundColor: Colors.green[300],
        elevation: 0,
        actions: [
          Container(
            color: Colors.blueGrey[100],
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          ExpenceList(expenceList: _expenceList),
        ],
      ),
    );
  }
}
