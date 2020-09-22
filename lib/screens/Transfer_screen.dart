import 'package:flutter/material.dart';
import '../screens/Interbank_transfer_screen.dart';
import '../screens/Intrabank_transfer_screen.dart';
import '../screens/NonAccountHolder_transfer_screen.dart';


class TransferScreen extends StatefulWidget {
  static const routeName = '/transfer';
  @override
  _TransferScreenState createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  final tab = TabBar(tabs: <Tab>[
    Tab(child: Text('Intra-Bank'),),
    Tab(child: Text('Inter-Bank'),),
    Tab(child: Text('Non-Account Holder'),),
  ]);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50.0),
            child: AppBar(
            bottom: tab,
          ),),
          body: TabBarView(
            children: [
              IntrabankTransferScreen(),
              InterbankTransferScreen(),
              NonAccountHolderTransferScreen(),
            ],
          ),
        ));
  }
}