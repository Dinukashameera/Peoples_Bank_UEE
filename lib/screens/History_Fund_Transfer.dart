import 'package:flutter/material.dart';
import '../widgets//history_items.dart';

class HistoryFundTransfer extends StatelessWidget {
  final List transactions;
  HistoryFundTransfer(this.transactions);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: transactions
            .where((item) => item['type'] == 'credit')
            .toList()
            .map((item) => HistoryItems(item))
            .toList(),
      ),
    );
  }
}
