import 'package:flutter/material.dart';
import './screens/Favourites_screen.dart';
import './screens/Transfer_Screen.dart';
import './screens/Settings_screen.dart';
import 'screens/Tabs_screen.dart';
import './screens/Payment_List_screen.dart';
import './screens/Test_screen.dart';
import './screens/AddFavouritePayment.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peoples Redde App',
      theme: ThemeData(
        primaryColor: Colors.black,
        accentColor: Colors.red[800],
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => TabsScreen(),
        FavouriteScreen.routeName: (context) => FavouriteScreen(),
        TransferScreen.routeName: (context) => TransferScreen(),
        SettingsScreen.routeName: (context) => SettingsScreen(),
        TestScreen.routeName: (context) => TestScreen(),
        PaymentListScreen.routeName: (context) => PaymentListScreen(),
        AddFavouritePayment.routeName : (context) => AddFavouritePayment()
      },
    );
  }
}
