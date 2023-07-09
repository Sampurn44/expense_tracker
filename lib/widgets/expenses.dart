import 'package:expense_tracker/widgets/charts/chart.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expenses.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_list.dart';
import 'package:expense_tracker/widgets/charts/chart.dart';

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
  void _openAddexpense() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registered.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final index = _registered.indexOf(expense);
    setState(() {
      _registered.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text("Expense Removed"),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registered.insert(index, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    Widget mainContent = const Center(
      child: Text("No data to show! Try adding new items to the list"),
    );
    if (_registered.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registered,
        removeExpense: _removeExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Expense Tracker",
          style: TextStyle(color: Colors.lime),
        ),
        actions: [
          IconButton(onPressed: _openAddexpense, icon: const Icon(Icons.add))
        ],
      ),
      body: width < 600
          ? Column(
              children: [
                Chart(
                  expenses: _registered,
                ),
                Expanded(child: mainContent),
              ],
            )
          : Row(
              children: [
                Expanded(
                  child: Chart(
                    expenses: _registered,
                  ),
                ),
                Expanded(child: mainContent),
              ],
            ),
    );
  }
}
