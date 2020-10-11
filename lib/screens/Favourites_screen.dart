import 'package:flutter/material.dart';
import '../screens/Bill_payment_screen.dart';
import '../screens/Fund_transfer_screen.dart';

class FavouriteScreen extends StatefulWidget {
  static const routeName = '/favorites';
 
  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  final tab = TabBar(tabs: <Tab>[
    Tab(
      child: Text('Beneficiaries'),
    ),
    Tab(
      child: Text('Bills'),
    ),
  ]);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50.0),
            child: AppBar(
              bottom: tab,
            ),
          ),
          body: TabBarView(
            children: [FundTransferScreen(), BillPaymentScreen()],
          ),
        ));
  }
}
