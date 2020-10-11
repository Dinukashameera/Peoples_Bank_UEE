import 'package:flutter/material.dart';
import 'package:peoples_bank/custom_icons_icons.dart';
import '../widgets/appBarActions.dart';
import './History_All_screen.dart';
import './History_Bill_Payment.dart';
import './History_Fund_Transfer.dart';
import '../custom_icons_icons.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class HistoryScreen extends StatefulWidget {
  static final routeName = '/history';

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final List historyPayment = [
    {
      "amount": "LKR 3400.00",
      "date": "12-05-2020",
      "ref": "098-323-4342-323",
      "method": "CASA ATM FSCASH (Nov)",
      "type": "credit",
      "icon": CustomIcons.minus_squared,
      "trailing": "2020-07-20"
    },
    {
      "amount": "LKR 3400.00",
      "date": "12-05-2020",
      "ref": "098-323-4342-323",
      "method": "CASA ATM FSCASH (Nov)",
      "type": "credit",
      "icon": CustomIcons.minus_squared,
      "trailing": "2020-07-20"
    },
    {
      "amount": "LKR 540.00",
      "date": "12-05-2020",
      "ref": "098-323-4342-323",
      "method": "CASA ATM FSCASH (Nov)",
      "type": "credit",
      "icon": CustomIcons.minus_squared,
      "trailing": "2020-07-20"
    },
    {
      "amount": "LKR 5740.00",
      "date": "12-05-2020",
      "ref": "098-323-4342-323",
      "method": "CASA ATM FSCASH (Nov)",
      "type": "debit",
      "icon": CustomIcons.plus_squared,
      "trailing": "2020-07-20"
    },
    {
      "amount": "LKR 6700.00",
      "date": "12-05-2020",
      "ref": "098-323-4342-323",
      "method": "CASA ATM FSCASH (Nov)",
      "type": "debit",
      "icon": CustomIcons.plus_squared,
      "trailing": "2020-07-20"
    },
    {
      "amount": "LKR 40.00",
      "date": "12-05-2020",
      "ref": "098-323-4342-323",
      "method": "CASA ATM FSCASH (Nov)",
      "type": "credit",
      "icon": CustomIcons.minus_squared,
      "trailing": "2020-07-20"
    }
  ];

  void searchHistory(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text('Select Date Range'),
              content: SfDateRangePicker(
                selectionMode: DateRangePickerSelectionMode.range,
                initialSelectedRange: PickerDateRange(
                    DateTime.now().subtract(const Duration(days: 4)),
                    DateTime.now().add(const Duration(days: 3))),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
                FlatButton(
                  child: Text('Ok'),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                )
              ],
            ));
  }

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
                  HistoryFundTransfer(historyPayment),
                  HistoryBillPayment(historyPayment)
                ],
              ),
            )),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.search,
            color: Colors.white,
          ),
          onPressed: () => searchHistory(context),
          backgroundColor: Color(0xFFC8262C),
        ));
  }
}
