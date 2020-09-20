import 'package:flutter/material.dart';
import '../widgets/Payment_List_item.dart';
import './AddFavouritePayment.dart';

class PaymentListScreen extends StatelessWidget {
  static const routeName = '/paymentlist';
  final favouritePayment = [
    {
      'type' : 'SLT 4G Internet',
      'account' : '056-856-0-9458625',
      'branch' :'Peoles bank Matara',
      'image' : 'https://www.slt.lk/sites/default/files/files/SLTLogo-png.png'
    },
    {
      'type' : 'SLT Fibre Internet',
      'account' : '056-856-0-9458625',
      'branch' :'Peoles bank Matara',
      'image' : 'https://www.slt.lk/sites/default/files/files/SLTLogo-png.png'
    },
    {
      'type' : 'SLT Peo Tv',
      'account' : '056-856-0-9458625',
      'branch' :'Peoles bank Kiribathgoda',
      'image' : 'https://www.slt.lk/sites/default/files/files/SLTLogo-png.png'
    },
    {
      'type' : 'SLT Fibre Internet',
      'account' : '056-856-0-9458625',
      'branch' :'Peoles bank Kandy',
      'image' : 'https://www.slt.lk/sites/default/files/files/SLTLogo-png.png'
    },
    {
      'type' : 'SLT 4G Internet',
      'account' : '056-856-0-9458625',
      'branch' :'Peoles bank Matara',
      'image' : 'https://www.slt.lk/sites/default/files/files/SLTLogo-png.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'https://www.parallax.lk/wp-content/uploads/2018/08/peoples-bank.png',
                fit: BoxFit.cover,
                height: 30,
                width: 100,
              )
            ],
          ),
          elevation: 0,
          actions: [
            Container(
              margin: EdgeInsets.only(right: 15),
              child: Row(
                children: [
                  Icon(Icons.notifications_none),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.access_time),
                ],
              ),
            )
          ]),
      body: ListView(
        children: favouritePayment.map((payment) => PaymentListItem(payment['type'],payment['account'],payment['branch'], payment['image'])).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed(AddFavouritePayment.routeName);
        },
        backgroundColor: Theme.of(context).accentColor,
      ),
    );
  }
}
