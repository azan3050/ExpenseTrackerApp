import 'package:expense_tracker_app/expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker_app/expenses.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {

  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category? _selectedCategory = Category.leisure;

  void presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate= await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }
  
  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Center(
              child: Text('Create new Expense',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),),
            ),
            TextField(
              controller: _titleController,
              maxLength: 50,
              decoration: const InputDecoration(
                label: Text('Title'),
              ),
            ),
            TextField(
              controller: _amountController,
              maxLength: 7,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                prefix: Text('₹'),
                label: Text('Amount'),
              ),
            ),
            SizedBox(width: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                        _selectedDate == null ?
                        'No date selected' :
                        formatter.format(_selectedDate!)
                    ),
                    IconButton(
                        onPressed: (){presentDatePicker();},
                        icon: Icon(Icons.calendar_month)),
                  ],
                ),

                DropdownButton(
                  value: _selectedCategory,
                    items: Category.values.map(
                            (category) => DropdownMenuItem(
                                value: category,
                                child: Text(category.name),
                            ),
                    ).toList(),
                    onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    setState((){
                      _selectedCategory = value;
                    });
                    })
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                    onPressed: () {Navigator.pop(context);},
                    child: const Text('Cancel')
                ),
                ElevatedButton(
                    onPressed: () {print(_titleController.text);},
                    child: const Text('Save Expense')
                ),
              ],
            ),

          ],
        ),
    );
  }
}
