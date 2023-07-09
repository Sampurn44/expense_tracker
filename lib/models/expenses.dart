import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();

enum Category { food, lesiure, travel, work }

final formatter = DateFormat.yMd();
const categoryIcon = {
  Category.food: Icons.fastfood,
  Category.travel: Icons.flight,
  Category.lesiure: Icons.movie,
  Category.work: Icons.work,
};

class Expense {
  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  get formatteddate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({
    required this.category,
    required this.expenses,
  });
  final Category category;
  final List<Expense> expenses;
  double get total {
    double sum = 0;
    for()
  
    
  }
}
