import 'package:flutter/material.dart';

class PaymentListItem extends StatelessWidget {

  // final String username;
  final String account;
  final String branch;
  final String type;
  final String image;

  PaymentListItem(this.type,this.account,this.branch,this.image );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.white,
          child: Image.network(image),
          // Icon(Icons.person_outline)
        ),
        title: Text(type),
        subtitle: Column(
          children: <Widget>[
            Row(
              children: [Text(account),],
            ),
            Row(
              children: [
                Text(
                  branch,
                  style: TextStyle(fontSize: 10),
                )
              ],
            ),
          ],
        ),
        trailing: PopupMenuButton(
          icon: Icon(Icons.more_vert),
          itemBuilder: (_) => [
            PopupMenuItem(child: Text('Update')),
            PopupMenuItem(child: Text('Delete')),
          ],
        ),
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(),
        ),
      ),
    );
  }
}
