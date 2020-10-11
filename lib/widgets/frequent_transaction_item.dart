import 'package:flutter/material.dart';
import '../custom_icons_icons.dart';

class FrequentTransactionItem extends StatelessWidget {
  final String name;
  final String account;
  final String bank;
  final IconData trailing;
  final String image;

  FrequentTransactionItem(this.name, this.account, this.bank, this.trailing,this.image);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
         onTap: (){print('hello');},
              child: Ink(
                              child: Card(
          margin: EdgeInsets.all(5.0),
          child: ListTile(
            contentPadding: EdgeInsets.all(10),
            leading: CircleAvatar(child: Image.network(image),),
            title: Text(
                name,
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: Color(0xFF616161),fontSize: 16),
            ),
            subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    account,
                    style: TextStyle(fontSize: 13),
                  ),
                  Text(bank, style: TextStyle(fontSize: 12),),
                ],
            ),
            trailing: Icon(trailing,size: 20,),
          ),
        ),
              ),
      ),
    );
  }
}
