import 'package:flutter/material.dart';
import 'package:peoples_bank/screens/Payment_List_screen.dart';
import '../screens/Payment_List_screen.dart';

class FavouriteBillPaymentAvatar extends StatelessWidget {
  final IconData icon;
  final String text;
  FavouriteBillPaymentAvatar(this.icon, this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(23.0)),
        color: Color.fromRGBO(38, 38, 38, 0.1),
      ),
      padding: EdgeInsets.all(12.0),
      height: 100,
      width: 100,
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(PaymentListScreen.routeName);
            },
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                // color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    // offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 4.0,
                  ),
                ],
              ),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  icon,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          FittedBox(
            fit: BoxFit.contain,
            child: Text(
              '$text',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
