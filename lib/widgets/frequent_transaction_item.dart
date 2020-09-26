import 'package:flutter/material.dart';

class FrequentTransactionItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(5.0),
      child: ListTile(
        leading: Text('leading'),
        title: Text('Amila Senavirathne'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[Text('056-6598-15154-552'), Text('Peoples bank')],
        ),
        trailing: Icon(Icons.send),
      ),
    );
  }
}
