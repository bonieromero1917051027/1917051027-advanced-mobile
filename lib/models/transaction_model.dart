import 'package:flutter/material.dart';

class TransactionModel {
  String? TransactionCategory;
  String? date;
  int? amount;
  String? symbol;
  IconData? logo;

  TransactionModel(
      {this.TransactionCategory,
      this.date,
      this.amount,
      this.symbol,
      this.logo});

  List<TransactionModel> getDummyData() {
    return [
      TransactionModel(
        TransactionCategory: "Top Up",
        date: "Oct 11",
        amount: 100000,
        symbol: "+",
        logo: Icons.add,
      ),
      TransactionModel(
        TransactionCategory: "Split",
        date: "Oct 9",
        amount: 700000,
        symbol: "-",
        logo: Icons.splitscreen,
      ),
      TransactionModel(
        TransactionCategory: "Withdraw",
        date: "Sep 30",
        amount: 200000,
        symbol: "-",
        logo: Icons.payments_outlined,
      ),
      TransactionModel(
        TransactionCategory: "Receive",
        date: "Aug 12 ",
        amount: 200000,
        symbol: "+",
        logo: Icons.call_received,
      ),
    ];
  }
}
