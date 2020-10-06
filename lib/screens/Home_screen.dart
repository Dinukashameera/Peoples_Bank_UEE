import 'package:flutter/material.dart';
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
            Text('Frequent transaction'),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  FrequentTransactionItem(),
                  FrequentTransactionItem(),
                  FrequentTransactionItem(),
                  FrequentTransactionItem(),
                  FrequentTransactionItem(),
                  FrequentTransactionItem(),
                  FrequentTransactionItem(),
                  FrequentTransactionItem(),
                  FrequentTransactionItem(),
                  FrequentTransactionItem(),
                ],
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
            Icons.add,
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
