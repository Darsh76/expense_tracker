import 'package:flutter/material.dart';
import 'package:expense_tracker/model/expense.dart';
import 'dart:ui';

class ExpensesItem extends StatelessWidget {
  const ExpensesItem(this.expense, {super.key});

  final Expense expense;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                expense.tittle,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 6,
              ),
              Row(
                children: [
                  Text('₹ ${expense.amount.toStringAsFixed(2)}'),
                  const Spacer(),
                  Row(
                    children: [
                      Icon(categoryIcons[expense.category]),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(expense.formattedDate)
                    ],
                  )
                ],
              )
            ],
          )),
    );
  }
}
