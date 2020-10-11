import 'package:flutter/material.dart';
import 'package:peoples_bank/custom_icons_icons.dart';
import '../widgets/frequent_transaction_item.dart';
import '../widgets/accoutDetails.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  static final routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

//change collapse into false
//testing purpose true krla thynne

class _HomeScreenState extends State<HomeScreen> {
  bool collapse = true;

  // final List frequesntTransactions = [
  //   {
  //     "name": "Amila Senavirathne",
  //     "account": "056-6598-15154-552",
  //     "bank": "People's Bank",
  //     "trailing": CustomIcons.paper_plane_empty,
  //     "image" : "https://ui-avatars.com/api/?size=128&rounded=true&background=4caf50&color=fff&name=Am+Se"
  //   },
  //   {
  //     "name": "Kavindu Tharaka",
  //     "account": "056-6598-15154-552",
  //     "bank": "People's Bank",
  //     "trailing": CustomIcons.paper_plane_empty,
  //      "image" : "https://ui-avatars.com/api/?size=128&rounded=true&background=00bcd4&color=fff&name=Ka+Th"
  //   },
  //   {
  //     "name": "Chamod Rathnayake",
  //     "account": "056-6598-15154-552",
  //     "bank": "People's Bank",
  //     "trailing": CustomIcons.paper_plane_empty,
  //      "image" : "https://ui-avatars.com/api/?size=128&rounded=true&background=f44336&color=fff&name=Ch+Ra"
  //   },
  //   {
  //     "name": "Dinuka Perera",
  //     "account": "056-6598-15154-552",
  //     "bank": "People's Bank",
  //     "trailing": CustomIcons.paper_plane_empty,
  //      "image" : "https://ui-avatars.com/api/?size=128&rounded=true&background=607d8b&color=fff&name=Di+Pe"
  //   },
  //   {
  //     "name": "Amila Senavirathne",
  //     "account": "056-6598-15154-552",
  //     "bank": "People's Bank",
  //     "trailing": CustomIcons.paper_plane_empty,
  //      "image" : "https://ui-avatars.com/api/?size=128&rounded=true&background=8bc34a&color=fff&name=Am+Se"
  //   },
  // ];

  List frequesntTransactions = [
    {
      'id': '004a',
      'name': 'Chamod Rathnayake',
      'account': '845323467834567',
      'branch': 'Bank of Ceylon - Chilaw',
      "trailing": CustomIcons.paper_plane_empty,
      'image':
          'https://ui-avatars.com/api/?size=128&rounded=true&background=607d8b&color=fff&name=Ch+Ra',
      'intraORinter': 'inter',
      'contact': '0756873214'
    },
    {
      'id': '005a',
      'name': 'Isuru Lakshan',
      'account': '32197628668642',
      'branch': 'Bank of Ceylon - Sooriyawewa',
      "trailing": CustomIcons.paper_plane_empty,
      'image':
          'https://ui-avatars.com/api/?size=128&rounded=true&background=8d64d7&color=fff&name=Is+Lak',
      'intraORinter': 'inter',
      'contact': '0778989744'
    },
    {
      'id': '001a',
      'name': 'Amila Senewirathne',
      'account': '05685609458625',
      'branch': 'People\'s bank - Matara',
      "trailing": CustomIcons.paper_plane_empty,
      'image':
          'https://ui-avatars.com/api/?size=128&rounded=true&background=4caf50&color=fff&name=Am+Se',
      'intraORinter': 'intra',
      'contact': '0712343546'
    },
    {
      'id': '002a',
      'name': 'Thamal Dilanka',
      'account': '02197628668642',
      'branch': 'Sampath Bank - Koswatta',
      "trailing": CustomIcons.paper_plane_empty,
      'image':
          'https://ui-avatars.com/api/?size=128&rounded=true&background=00bcd4&color=fff&name=Th+Dil',
      'intraORinter': 'inter',
      'contact': '0717676876'
    },
    {
      'id': '003a',
      'name': 'Kavindu Tharaka',
      'account': '23534608458688',
      'branch': 'People\'s bank - Weeraketiya',
      "trailing": CustomIcons.paper_plane_empty,
      'image':
          'https://ui-avatars.com/api/?size=128&rounded=true&background=f44336&color=fff&name=Ka+Th',
      'intraORinter': 'intra',
      'contact': '0767362543'
    }
  ];

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   print('did init call');
  //   addAvatar();
  // }

  // void addAvatar() async {
  //   try {
  //     const url = 'https://ui-avatars.com/api/?name=Elon+Musk';

  //     setState(() {
  //       frequesntTransactions.map((trnx) => {
  //         trnx['leading'] = "hello"

  //     });

  //     });
  //     print(frequesntTransactions);

  //     var response = await http.get(url);
  //     print(response);
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  void collapseWindow() {
    setState(() {
      collapse = !collapse;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (collapse) {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              color: Color(0xFF424242),
              width: double.infinity,
              height: 200,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        child: ButtonTheme(
                            height: 20,
                            minWidth: 80,
                            child: FlatButton(
                                color: Color(0xFFc8262c),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0)),
                                onPressed: () {},
                                child: Text(
                                  'Primary',
                                  style: TextStyle(color: Colors.white),
                                ))),
                      )
                    ],
                  ),
                  Text(
                    'Available Balance',
                    style: TextStyle(color: Color(0xFFbdbdbd)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    //  crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        '456,678.00',
                        style: TextStyle(fontSize: 38, color: Colors.white),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15, left: 4),
                        child: Text(
                          'LKR',
                          style: TextStyle(fontSize: 10, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Saving Account',
                    style: TextStyle(fontSize: 10, color: Color(0xFFe0e0e0)),
                  ),
                  Text(
                    '369 2658 2365 2536',
                    style: TextStyle(fontSize: 10, color: Color(0xFFbdbdbd)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: GestureDetector(
                      onTap: collapseWindow,
                      child: Text(
                        'Account Details',
                        style: TextStyle(
                            color: Color(0xFFbdbdbd),
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 15),
              child: Text(
                'Frequent Transactions',
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView(
                children: frequesntTransactions
                    .map((trnx) => FrequentTransactionItem(
                          trnx['name'],
                          trnx['account'],
                          trnx['branch'],
                          trnx['trailing'],
                          trnx['image'],
                          trnx['id'],
                          trnx['intraORinter'],
                          trnx['contact'],
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      );
    } else {
      return Scaffold(
        body: AccountDetails(collapseWindow),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            CustomIcons.share,
            color: Colors.white,
          ),
          onPressed: () {},
          backgroundColor: Color(0xFFC8262C),
        ),
      );
    }
  }
}

//
