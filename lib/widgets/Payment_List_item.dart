import 'package:flutter/material.dart';

class PaymentListItem extends StatelessWidget {
  // final String username;
  final String account;
  final String branch;
  final String type;
  final String image;

  PaymentListItem(this.type, this.account, this.branch, this.image);

  void deleteModal(BuildContext context, String type, String branch) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 350,
          color: Colors.green,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(35.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Icon(Icons.warning),
                  Text('Are you sure to delete?'),
                  Text(type),
                  Text(branch),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        child: const Text('Cancel'),
                        onPressed: () => Navigator.pop(context),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      RaisedButton(
                        color: Theme.of(context).accentColor,
                        child: const Text(
                          'Delete',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () => Navigator.pop(context),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

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
              children: [
                Text(account),
              ],
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
            PopupMenuItem(
              child: Text('Update'),
              value: 'update',
            ),
            PopupMenuItem(
              child: Text('Delete'),
              value: 'delete',
            ),
          ],
          onSelected: (value) {
            if (value == 'delete') deleteModal(context, type, branch);
          },
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
