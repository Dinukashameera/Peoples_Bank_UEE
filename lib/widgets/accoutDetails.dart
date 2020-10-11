import 'package:flutter/material.dart';
import './account_details_items.dart';

class AccountDetails extends StatefulWidget {
  Function collapse;
  AccountDetails(this.collapse);

  @override
  _AccountDetailsState createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 90,
          width: double.infinity,
          color: Color(0xFF424242),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 3),
                child: Text(
                  'Available balance',
                  style: TextStyle(color: Color(0xFFbdbdbd)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 4, left: 15, top: 5),
                    child: Text(
                      '346,340.00',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 12),
                      child: Text(
                        'LKR',
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      )),
                ],
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: GestureDetector(
                  onTap: widget.collapse,
                  child: Text(
                    'Show Less',
                    style: TextStyle(
                        fontSize: 10,
                        color: Color(0xFFbdbdbd),
                        decoration: TextDecoration.underline),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
            padding: EdgeInsets.only(left: 15),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
              ),
              child: Text(
                'Saving Account Details',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              ),
            )),
        Expanded(
          child: Container(
            
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AccountDetailsItems('Account Number', '078-2-300-0-346534'),
                AccountDetailsItems('Account Branch', 'Malabe'),
                AccountDetailsItems('Account Status', 'Active'),
                AccountDetailsItems('Current Type', 'LKR'),
                AccountDetailsItems('Last Statement Date', '-'),
                AccountDetailsItems('Product Name', 'Saving Normal'),
                AccountDetailsItems('Unrealized Cheques', 'LKR 0.00'),
                AccountDetailsItems('Pending PB Cheques (CR)', 'LKR 0.00'),
                AccountDetailsItems('Account Opened Date', '20-10-2015'),
                AccountDetailsItems('Ledger Balance', 'LKR 346340.300'),

              ],
            ),
          ),
        )
      ],
    ));
  }
}
