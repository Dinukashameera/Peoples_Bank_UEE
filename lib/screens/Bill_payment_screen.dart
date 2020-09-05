import 'package:flutter/material.dart';
import '../widgets/favourite_bill_payment_avatar.dart';


class BillPaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: <Widget>[
        Expanded(
          
          child: GridView.count(
          // scrollDirection: Axis.horizontal,
          crossAxisCount: 3,
          children: List.generate(9, (index) {
            return Center(
              child: FavouriteBillPaymentAvatar(index),
            );
          }),
        ),)
      ],),
    );
  }
}