import 'package:flutter/material.dart';
import 'package:peoples_bank/custom_icons_icons.dart';
import './Favourites_screen.dart';
import './Transfer_screen.dart';
import './Settings_screen.dart';
import './Bills_screen.dart';
import './Home_screen.dart';
import '../widgets/main_drawer.dart';
import '../widgets/appBarActions.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = '/tabs_screen';
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedIndex = 2;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    BillsScreen(),
    TransferScreen(),
    HomeScreen(),
    FavouriteScreen(),
    BillsScreen(),
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
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      drawer: MainDrawer(),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Color(0xFF212121),
        ),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(CustomIcons.newspaper),
              title: Text('Billers'),
            ),
            BottomNavigationBarItem(
              icon: Icon(CustomIcons.paper_plane_empty),
              title: Text('Transfer'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_border,
              ),
              title: Text('Favourite'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.payment,
              ),
              title: Text('Cheques'),
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.settings),
            //   title: Text('Setting'),
            // ),
          ],
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color(0xFFfbb418),
          backgroundColor: Color(0xFF212121),
          unselectedItemColor: Colors.white,
          onTap: _onItemTapped,
        ),
      ),
      // )
    );
  }
}
