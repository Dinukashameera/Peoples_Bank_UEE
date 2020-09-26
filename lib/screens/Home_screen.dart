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
              color: Colors.amber,
              width: double.infinity,
              height: 200,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[Text('primary')],
                  ),
                  Text('Available Balance'),
                  Text('3456,6789.00'),
                  Text('Saving Account'),
                  Text('3567894521'),
                  RaisedButton(onPressed: () {
                    setState(() {
                      collapse = !collapse;
                    });
                    print(collapse);
                  })
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
