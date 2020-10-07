import 'package:flutter/material.dart';
import '../widgets//history_items.dart';

class HistoryAll extends StatelessWidget {
  final List transactions;
  HistoryAll(this.transactions);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      children: transactions.map((item) => HistoryItems(item)).toList(),
    ));
  }
}
