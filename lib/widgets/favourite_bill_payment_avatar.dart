import 'package:flutter/material.dart';
import '../screens/Test_screen.dart';
class FavouriteBillPaymentAvatar extends StatelessWidget {
  final int index;
  FavouriteBillPaymentAvatar(this.index);

  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap:() {
             Navigator.of(context).pushNamed(TestScreen.routeName);
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
