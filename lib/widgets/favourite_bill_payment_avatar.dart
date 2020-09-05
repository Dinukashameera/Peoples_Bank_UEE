import 'package:flutter/material.dart';
import 'package:peoples_bank/screens/Payment_List_screen.dart';
import '../screens/Payment_List_screen.dart';
class FavouriteBillPaymentAvatar extends StatelessWidget {
  final int index;
  FavouriteBillPaymentAvatar(this.index);

  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap:() {
             Navigator.of(context).pushNamed(PaymentListScreen.routeName);
          },
          child: CircleAvatar(
            child: Icon(Icons.ac_unit),
          ),
        ),
        Text('$index')
      ],
    );
  }
}
