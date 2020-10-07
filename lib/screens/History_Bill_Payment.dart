import 'package:flutter/material.dart';
import '../widgets//history_items.dart';

class HistoryBillPayment extends StatelessWidget {
  //final List<Map<String, String>> transactions;
  final List transactions;
  HistoryBillPayment(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      children: transactions
          .where((item) => item['type'] == 'debit')
          .toList()
          .map((item) => HistoryItems(item))
          .toList(),
    ));
  }
}
