import 'package:expense/app/core/constants/const_colors.dart';
import 'package:expense/app/data/transaction_model.dart';
import 'package:flutter/material.dart';

class CircularData {
  CircularData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}

List<CircularData> circularTransaction(List<Transaction> transactions, TransactionStatus status) {
  return transactions.where((transactions) => transactions.transactionStatus == status).map((transaction) {
    Color getColor() {
      switch (transaction.title) {
        case 'Shopping':
          return yellow100;
        case 'Subscription':
          return violet100;
        case 'Food':
          return red100;
        case 'Salary':
          return green100;
        case 'Transportation':
          return blue60;
        case 'Passive Income':
          return dark50;
        default:
          return violet20;
      }
    }

    return CircularData(transaction.title, transaction.amount, getColor());
  }).toList();
}
