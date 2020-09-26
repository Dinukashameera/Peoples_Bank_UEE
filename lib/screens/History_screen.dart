import 'package:flutter/material.dart';
import '../widgets/appBarActions.dart';
import './History_All_screen.dart';
import './History_Bill_Payment.dart';
import './History_Fund_Transfer.dart';

class HistoryScreen extends StatefulWidget {
  static final routeName = '/history';

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final List<Map<String,String>> historyPayment = [
    {
      "amount": "LKR 3400.00",
      "date": "12-05-2020",
      "ref": "098-323-4342-323",
      "method": "CASA ATM FSCASH (Nov)",
      "type": "credit"
    },
    {
      "amount": "LKR 3400.00",
      "date": "12-05-2020",
      "ref": "098-323-4342-323",
      "method": "CASA ATM FSCASH (Nov)",
      "type": "credit"
    },
    {
      "amount": "LKR 540.00",
      "date": "12-05-2020",
      "ref": "098-323-4342-323",
      "method": "CASA ATM FSCASH (Nov)",
      "type": "credit"
    },
    {
      "amount": "LKR 5740.00",
      "date": "12-05-2020",
      "ref": "098-323-4342-323",
      "method": "CASA ATM FSCASH (Nov)",
      "type": "debit"
    },
    {
      "amount": "LKR 6700.00",
      "date": "12-05-2020",
      "ref": "098-323-4342-323",
      "method": "CASA ATM FSCASH (Nov)",
      "type": "debit"
    },
    {
      "amount": "LKR 40.00",
      "date": "12-05-2020",
      "ref": "098-323-4342-323",
      "method": "CASA ATM FSCASH (Nov)",
      "type": "credit"
    }
  ];

  final tab = TabBar(tabs: <Tab>[
    Tab(
      child: Text('All'),
    ),
    Tab(
      child: Text('Fund Transfer'),
    ),
    Tab(
      child: Text('Bill Payment'),
    ),
  ]);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets\\images\\peoples-bank.png',
                fit: BoxFit.cover,
                height: 30,
                width: 100,
              )
            ],
          ),
          elevation: 0,
          actions: [AppBarActions()]),
      body: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(50.0),
              child: AppBar(
                bottom: tab,
              ),
            ),
            body: TabBarView(
              children: [
                HistoryAll(historyPayment),
                HistoryFundTransfer(),
                HistoryBillPayment()
              ],
            ),
          )),
    );
  }
}
