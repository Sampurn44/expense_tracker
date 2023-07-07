import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expenses.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registered = [
    Expense(
      title: "Flutter Course ",
      amount: 540,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: "Cinema ",
      amount: 250,
      date: DateTime.now(),
      category: Category.lesiure,
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text(
            "THE CHART WAS HERE HEHE!",
            style: TextStyle(color: Colors.black),
          ),
          Expanded(child: ExpensesList(expenses: _registered)),
        ],
      ),
    );
  }
}
