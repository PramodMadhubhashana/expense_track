import 'package:flutter/material.dart';

class Expense extends StatefulWidget {
  const Expense({Key? key}) : super(key: key);

  @override
  State<Expense> createState() => _ExpenseState();
}

class _ExpenseState extends State<Expense> {
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
    );
  }
}
