import 'package:flutter/material.dart';

class PaymentSummary extends StatelessWidget {
  final Map details;
  PaymentSummary(this.details);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: <Widget>[
        Text('methanin wadinne'),
        Text(details['account']),
        Text(details['amount']),
        Text(details['date']),

      ],),
    );
  }
}