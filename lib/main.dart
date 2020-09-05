import 'package:flutter/material.dart';
import './screens/Favourites_screen.dart';
import './screens/Transfer_Screen.dart';
import './screens/Settings_screen.dart';
import 'screens/Tabs_screen.dart';

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
      title: 'BOC REDDE APP',
      theme: ThemeData(
        primaryColor: Colors.black,
        accentColor: Colors.yellow,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => TabsScreen(),
        FavouriteScreen.routeName: (context) => FavouriteScreen(),
        TransferScreen.routeName: (context) => TransferScreen(),
        SettingsScreen.routeName: (context) => SettingsScreen()
      },
    );
  }
}
