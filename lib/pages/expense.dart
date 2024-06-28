import 'package:expense_track/models/expence.dart';
import 'package:expense_track/widget/add_New_Expence.dart';
import 'package:expense_track/widget/expence_list.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

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

  void _openAddExpencesOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return AddNewExpence(
          onAddExpensive: onAddNewExpence,
        );
      },
    );
  }

  void onAddNewExpence(ExpenceModel expence) {
    setState(() {
      _expenceList.add(expence);
      calCategoryValue();
    });
  }

  Map<String, double> dataMap = {
    "Food": 5,
    "Travel": 3,
    "Leasure": 2,
    "Work": 2,
  };

  double foodval = 0;
  double travelVal = 0;
  double leasureVal = 0;
  double workVal = 0;

  void calCategoryValue() {
    double foodvalTotal = 0;
    double travelValTotal = 0;
    double leasureValTotal = 0;
    double workValTotal = 0;

    for (final Expense in _expenceList) {
      if (Expense.category == Category.food) {
        foodvalTotal += Expense.amount;
      }
      if (Expense.category == Category.travel) {
        travelValTotal += Expense.amount;
      }
      if (Expense.category == Category.leasure) {
        leasureValTotal += Expense.amount;
      }
      if (Expense.category == Category.work) {
        workValTotal += Expense.amount;
      }
    }
    setState(() {
      foodval = foodvalTotal;
      travelVal = travelValTotal;
      leasureVal = leasureValTotal;
      workVal = workValTotal;
    });
    dataMap = {
      "Food": foodval,
      "Travel": travelVal,
      "Leasure": leasureVal,
      "Work": workVal,
    };
  }

  @override
  void initState() {
    super.initState();
    calCategoryValue();
  }

  void onDeleteExpence(ExpenceModel expence) {
    ExpenceModel deletingExpence = expence;
    final int removeIndex = _expenceList.indexOf(expence);
    setState(() {
      _expenceList.remove(expence);
      calCategoryValue();
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("Delete Successfull"),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _expenceList.insert(removeIndex, deletingExpence);
              calCategoryValue();
            });
          },
        ),
      ),
    );
  }

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
                onPressed: _openAddExpencesOverlay,
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
          PieChart(dataMap: dataMap),
          ExpenceList(
            expenceList: _expenceList,
            onDeleteExpence: onDeleteExpence,
          ),
        ],
      ),
    );
  }
}
