import 'package:flutter/material.dart';
import './account_details_items.dart';

class AccountDetails extends StatefulWidget {
  @override
  _AccountDetailsState createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 70,
          width: double.infinity,
          color: Colors.amber,
          child: Column(
            children: <Widget>[
              Text('Available balance'),
              Text('3456698979'),
            ],
          ),
        ),
        Container(
            padding: EdgeInsets.only(left: 10),
            child: Text('Saving Account Details', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),)),
        AccountDetailsItems('Account Number', '078-2-300-0-346534'),
        AccountDetailsItems('Account Branch', 'Malabe'),
        AccountDetailsItems('Account Status', 'Active'),
        AccountDetailsItems('Current Type', 'LKR'),
        AccountDetailsItems('Last Statement Date', '-'),
        AccountDetailsItems('Product Name', 'Saving Normal'),
        AccountDetailsItems('Unrealized Cheques', 'LKR 0.00'),
        AccountDetailsItems('Pending PB Cheques (CR)', 'LKR 0.00'),
        AccountDetailsItems('Account Opened Date', '20-10-2015'),
        AccountDetailsItems('Ledger Balance', 'LKR 346340.300'),
      ],
    ));
  }
}
