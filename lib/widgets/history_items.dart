import 'package:flutter/material.dart';
import 'package:peoples_bank/widgets/acknowledgementTransfer.dart';

class HistoryItems extends StatelessWidget {
  final Map item;
  HistoryItems(this.item);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "/acknowledgement",
            arguments: AcknowledgementTransfer('Amal Udayakantha',
                '2376515481212', 'Matara', 'Bank of Ceylon', '9000'));
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(),
          ),
        ),
        child: ListTile(
          leading: Icon(
            item['icon'],
            color: item['type'] == 'credit' ? Colors.red : Colors.green,
          ),
          title: Text(
            item['amount'],
            style: TextStyle(
                fontWeight: FontWeight.w700, color: Color(0xFF616161)),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                item['ref'],
                style: TextStyle(color: Color(0xFF616161), fontSize: 10),
              ),
              Text(
                item['method'],
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
          trailing: Text(item['date']),
        ),
      ),
    );
  }
}
