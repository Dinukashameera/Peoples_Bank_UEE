import 'package:flutter/material.dart';
import '../widgets/favourite_bill_payment_avatar.dart';
import '../custom_icons_icons.dart';

class BillPaymentScreen extends StatelessWidget {
  final paymentCategories = [
    {'icon': CustomIcons.phone_handset, 'title': 'Communication'},
    {'icon': Icons.lock_outline, 'title': 'Insurance'},
    {'icon': CustomIcons.wrench, 'title': 'Utilities'},
    {'icon': CustomIcons.book, 'title': 'Education'},
    {'icon': CustomIcons.money, 'title': 'Finance'},
    {'icon': CustomIcons.heartbeat, 'title': 'Charity'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(color: Colors.red),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 48, top: 20, right: 50),
            decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0))),
                  contentPadding: const EdgeInsets.symmetric(vertical: 0.0)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 48, top: 20),
            child: Text(
              'Categories',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: GridView.count(
              childAspectRatio: 3 / 2,
              crossAxisCount: 2,
              children: paymentCategories
                  .map((category) => Center(
                        child: FavouriteBillPaymentAvatar(
                            category['icon'], category['title']),
                      ))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
