import 'package:expense_track/models/expence.dart';
import 'package:flutter/material.dart';

class AddNewExpence extends StatefulWidget {
  final void Function(ExpenceModel expence) onAddExpensive;
  const AddNewExpence({
    Key? key,
    required this.onAddExpensive,
  }) : super(key: key);

  @override
  State<AddNewExpence> createState() => _AddNewExpenceState();
}

class _AddNewExpenceState extends State<AddNewExpence> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  Category _selectedCategory = Category.food;

  //date timme picker

  final initialDate = DateTime.now();
  final firstDate = DateTime(
      DateTime.now().year - 1, DateTime.now().month, DateTime.now().day);
  final lastDate = DateTime(
      DateTime.now().year + 1, DateTime.now().month, DateTime.now().day);
  DateTime _selectDate = DateTime.now();

  Future<void> _openDateModel() async {
    try {
      final pickdate = await showDatePicker(
          context: context,
          initialDate: initialDate,
          firstDate: firstDate,
          lastDate: lastDate);

      setState(() {
        _selectDate = pickdate!;
      });
    } catch (erro) {
      print(erro.toString());
    }
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _amountController.dispose();
  }

  void _handleFromSubmition() {
    final userAmount = double.parse(_amountController.text.trim());
    //
    if (_titleController.text.trim().isEmpty ||
        _amountController.text.trim().isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return (AlertDialog(
            title: const Text("Enter Valid Data"),
            content: const Text(
                "Please Enter valid data for the title and the amount here the title can be empty and the amount can't be less than zero"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("close"),
              ),
            ],
          ));
        },
      );
    } else {
      ExpenceModel newExpence = ExpenceModel(
          title: _titleController.text.trim(),
          amount: userAmount,
          date: _selectDate,
          category: _selectedCategory);
      widget.onAddExpensive(newExpence);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(
              hintText: "Add new Expence",
              label: Text("Title"),
            ),
            keyboardType: TextInputType.text,
            maxLength: 50,
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  decoration: const InputDecoration(
                    hintText: "Enter The Amount",
                    label: Text("Amount"),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      formatedDate.format(_selectDate),
                    ),
                    IconButton(
                      onPressed: _openDateModel,
                      icon: const Icon(Icons.date_range_outlined),
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              DropdownButton(
                value: _selectedCategory,
                items: Category.values
                    .map(
                      (category) => DropdownMenuItem(
                        value: category,
                        child: Text(category.name),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value!;
                  });
                },
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: const ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(Colors.redAccent),
                      ),
                      child: const Text("Close"),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: _handleFromSubmition,
                      style: const ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(Colors.greenAccent),
                      ),
                      child: const Text("Save"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
