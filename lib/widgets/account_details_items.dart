import 'package:flutter/material.dart';

class AccountDetailsItems extends StatelessWidget {
  final String title;
  final String subtitle;

  AccountDetailsItems(this.title, this.subtitle);

  @override
  Widget build(BuildContext context) {
    return Expanded(
          child: Container(
            
        padding: EdgeInsets.only(left: 20),
        margin: EdgeInsets.only(top: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(title , style: TextStyle(color: Color(0xFF616161)),),
            Text(subtitle),
          ],
        ),
      ),
    );
  }
}
