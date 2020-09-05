import 'package:flutter/material.dart';
import '../widgets/Payment_List_item.dart';

class PaymentListScreen extends StatelessWidget {
  static const routeName = '/paymentlist';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'https://www.parallax.lk/wp-content/uploads/2018/08/peoples-bank.png',
                fit: BoxFit.cover,
                height: 30,
                width: 100,
              )
            ],
          ),
          elevation: 0,
          actions: [
            Container(
              margin: EdgeInsets.only(right: 15),
              child: Row(
                children: [
                  Icon(Icons.notifications_none),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.access_time),
                ],
              ),
            )
          ]),
      body: ListView(
        children: <Widget>[
          PaymentListItem(),
          PaymentListItem(),
          PaymentListItem(),
          PaymentListItem(),
          PaymentListItem(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
        backgroundColor: Theme.of(context).accentColor,
      ),
    );
  }
}
