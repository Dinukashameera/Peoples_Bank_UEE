import 'package:flutter/material.dart';

class HistoryItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text('icon'),
      title: Text('title'),
      subtitle: Column(
        children: <Widget>[
          Text('sub 1'),
          Text('sub 2'),
        ],
      ),
      trailing: Text('date'),
    );
  }
}