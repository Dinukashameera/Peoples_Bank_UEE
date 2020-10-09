import 'package:flutter/material.dart';
import '../widgets/favouritePaymentDelete.dart';

class PaymentListItem extends StatelessWidget {
  // final String username;
  final String account;
  final String branch;
  final String type;
  final String image;

  PaymentListItem(this.type, this.account, this.branch, this.image);

  void deleteModal(BuildContext context, String type, String branch) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            color: Color(0xFF737373),
            height: MediaQuery.of(context).size.height * 0.32,
            child: Container(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 30, bottom: 3),
                      child: Icon(
                        Icons.warning,
                        size: 40.0,
                      ),
                    ),
                    Container(
                        child: Text(
                      'Are you sure to delete?',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        type,
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(branch,
                          style: TextStyle(
                              fontSize: 13.0, color: Color(0xFFbdbdbd))),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ButtonTheme(
                            minWidth: 120.0,
                            child: RaisedButton(
                              onPressed: () {},
                              child: Text('Cancel'),
                              color: Color(0xFF757575),
                              textColor: Colors.white,
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          ButtonTheme(
                            minWidth: 120.0,
                            child: RaisedButton(
                              onPressed: () {},
                              child: Text('Delete'),
                              color: Color(0xFFc8262c),
                              textColor: Colors.white,
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(40),
                  topRight: const Radius.circular(40),
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.white,
          child: Image.asset(image),
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
