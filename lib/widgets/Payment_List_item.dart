import 'package:flutter/material.dart';

class PaymentListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          child: Icon(Icons.person_outline),
        ),
        title: Text('Thamal Dilanka'),
        subtitle: Column(
          children: <Widget>[
            Row(
              children: [Text('056-856-0-9458625')],
            ),
            Row(
              children: [
                Text(
                  'people Bank Matara',
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
