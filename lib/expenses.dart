import 'package:expense_tracker_app/expenses_list.dart';
import 'package:expense_tracker_app/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker_app/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {

  final List<Expense> _registeredExpenses= [
    Expense(
        title: 'Flutter Course',
        amount : 450,
        date: DateTime.now(),
        category: Category.work.toString()
    ),
    Expense(
      title: 'Cinema',
      amount : 150,
      date: DateTime.now(),
      category: Category.leisure.toString(),
    )
  ];
  
  void openAddExpenseOverlay() {
    showModalBottomSheet(context: context, builder: (ctx) => NewExpense());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ExpenseTracker'),
        actions: [
          IconButton(onPressed: () => openAddExpenseOverlay(), icon: const Icon(Icons.add)),
        ],
      ),
      body: Column(
        children: [
          const Text('the chart'),
          Expanded(
              child: ExpensesList(expenses: _registeredExpenses)
          ),
        ],
      ),
    );
  }
}
