import 'package:flutter/material.dart';
import 'package:peoples_bank/custom_icons_icons.dart';
import '../widgets/frequent_transaction_item.dart';
import '../widgets/accoutDetails.dart';

class HomeScreen extends StatefulWidget {
  static final routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

//change collapse into false
//testing purpose true krla thynne

class _HomeScreenState extends State<HomeScreen> {
  bool collapse = true;

  final List frequesntTransactions = [
    {
      "name": "Amila Senavirathne",
      "account": "056-6598-15154-552",
      "bank": "People's Bank",
      "trailing": CustomIcons.paper_plane_empty
    },
    {
      "name": "Kavindu Tharaka",
      "account": "056-6598-15154-552",
      "bank": "People's Bank",
      "trailing": CustomIcons.paper_plane_empty
    },
    {
      "name": "Chamod Rathnayake",
      "account": "056-6598-15154-552",
      "bank": "People's Bank",
      "trailing": CustomIcons.paper_plane_empty
    },
    {
      "name": "Dinuka Perera",
      "account": "056-6598-15154-552",
      "bank": "People's Bank",
      "trailing": CustomIcons.paper_plane_empty
    },
    {
      "name": "Amila Senavirathne",
      "account": "056-6598-15154-552",
      "bank": "People's Bank",
      "trailing": CustomIcons.paper_plane_empty
    },
  ];

  @override
  Widget build(BuildContext context) {
    if (collapse) {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              color: Color(0xFF424242),
              width: double.infinity,
              height: 200,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        child: ButtonTheme(
                            height: 20,
                            minWidth: 80,
                            child: FlatButton(
                                color: Color(0xFFc8262c),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0)),
                                onPressed: () {},
                                child: Text(
                                  'Primary',
                                  style: TextStyle(color: Colors.white),
                                ))),
                      )
                    ],
                  ),
                  Text(
                    'Available Balance',
                    style: TextStyle(color: Color(0xFFbdbdbd)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    //  crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        '3456,6789.00',
                        style: TextStyle(fontSize: 38, color: Colors.white),
                      ),
                      Text(
                        'LKR',
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Saving Account',
                    style: TextStyle(fontSize: 10, color: Color(0xFFe0e0e0)),
                  ),
                  Text(
                    '369 2658 2365 2536',
                    style: TextStyle(fontSize: 10, color: Color(0xFFbdbdbd)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        collapse = false;
                      });
                    },
                    child: Text(
                      'Account Details',
                      style: TextStyle(
                          fontSize: 10,
                          color: Color(0xFFbdbdbd),
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 15),
              child: Text(
                'Frequent Transactions',
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView(
                children: frequesntTransactions
                    .map((trnx) => FrequentTransactionItem(trnx['name'],trnx['account'],trnx['bank'],trnx['trailing']))
                    .toList(),
              ),
            ),
          ],
        ),
      );
    } else {
      return Scaffold(
        body: AccountDetails(),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            CustomIcons.share,
            color: Colors.white,
          ),
          onPressed: () {},
          backgroundColor: Color(0xFFC8262C),
        ),
      );
    }
  }
}

//
