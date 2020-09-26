import 'package:flutter/material.dart';
import '../widgets/Payment_List_item.dart';
import './AddFavouritePayment.dart';
import '../widgets/appBarActions.dart';

class PaymentListScreen extends StatelessWidget {
  static const routeName = '/paymentlist';
  final favouritePayment = [
    {
      'type': 'SLT 4G Internet',
      'account': '056-856-0-9458625',
      'branch': 'Peoles bank Matara',
      'image': 'https://www.slt.lk/sites/default/files/files/SLTLogo-png.png'
    },
    {
      'type': 'SLT Fibre Internet',
      'account': '056-856-0-9458625',
      'branch': 'Peoles bank Matara',
      'image': 'https://www.slt.lk/sites/default/files/files/SLTLogo-png.png'
    },
    {
      'type': 'SLT Peo Tv',
      'account': '056-856-0-9458625',
      'branch': 'Peoles bank Kiribathgoda',
      'image': 'https://www.slt.lk/sites/default/files/files/SLTLogo-png.png'
    },
    {
      'type': 'SLT Fibre Internet',
      'account': '056-856-0-9458625',
      'branch': 'Peoles bank Kandy',
      'image': 'https://www.slt.lk/sites/default/files/files/SLTLogo-png.png'
    },
    {
      'type': 'SLT 4G Internet',
      'account': '056-856-0-9458625',
      'branch': 'Peoles bank Matara',
      'image': 'https://www.slt.lk/sites/default/files/files/SLTLogo-png.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets\\images\\peoples-bank.png',
                fit: BoxFit.cover,
                height: 30,
                width: 100,
              )
            ],
          ),
          elevation: 0,
          actions: [AppBarActions()]),
      body: ListView(
        children: favouritePayment
            .map((payment) => PaymentListItem(payment['type'],
                payment['account'], payment['branch'], payment['image']))
            .toList(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(AddFavouritePayment.routeName);
        },
        backgroundColor: Color(0xFFC8262C),
      ),
    );
  }
}
