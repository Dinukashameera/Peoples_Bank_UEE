import 'package:flutter/material.dart';
import './Favourites_screen.dart';
import './Transfer_screen.dart';
import './Settings_screen.dart';
import './Bills_screen.dart';
import '../widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    TransferScreen(),
    SettingsScreen(),
    BillsScreen(),
    FavouriteScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
                    SizedBox(width: 10,),
                    Icon(Icons.access_time),
                  ],
                ),
              )
            ]),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        drawer: MainDrawer(),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(canvasColor: Colors.black),
          child: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Biller'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.send),
                title: Text('Transfers'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border,),
                title: Text('Home'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                title: Text('Favourite' ),
              ),
             
            ],
            currentIndex: _selectedIndex,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.amber[800],
            
            backgroundColor: Colors.black,
            unselectedItemColor: Colors.white,
            onTap: _onItemTapped,
          ),
        ));
  }
}
