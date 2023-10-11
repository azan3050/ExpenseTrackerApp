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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('the chart'),

        ],
      ),
    );
  }
}
