import 'package:expense_tracker/expenses.dart';
import 'package:expense_tracker/expenses_item.dart';
import 'package:flutter/material.dart';

import 'model/expense.dart';

class ExpensesList extends StatelessWidget {
  ExpensesList(
      {super.key, required this.expenses, required this.onRemoveExpense});

  List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        direction: DismissDirection.endToStart,
        onDismissed: (direction) {
          onRemoveExpense(expenses[index]);
        },
        key: ValueKey(expenses[index]),
        background: Card(
          color: Theme.of(context).colorScheme.error.withOpacity(0.50),
          margin: EdgeInsets.symmetric(
              horizontal: Theme.of(context).cardTheme.margin!.horizontal),
          child: const Icon(
            Icons.delete_sweep,
          ),
        ),
        child: ExpensesItem(expenses[index]),
      ),
    );
  }
}
