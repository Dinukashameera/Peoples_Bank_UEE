import 'package:flutter/material.dart';
import '../screens/History_screen.dart';

class AppBarActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15),
      child: Row(
        children: [
          Icon(Icons.notifications_none),
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            child: Icon(Icons.access_time),
            onTap: () {
              Navigator.of(context).pushNamed(HistoryScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
