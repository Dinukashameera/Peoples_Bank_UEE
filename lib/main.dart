import 'package:flutter/material.dart';
import 'package:peoples_bank/screens/Acknowledgement_Screen.dart';
import 'package:peoples_bank/screens/Tabs_screen.dart';
import './screens/Favourites_screen.dart';
import './screens/Transfer_Screen.dart';
import './screens/Settings_screen.dart';
import 'screens/Add_favorite_beneficiary.dart';
import 'screens/Favorite_inter_bank_beneficiary.dart';
import 'screens/Favorite_intra_bank_beneficiary.dart';
import 'screens/Tabs_screen.dart';
import './screens/Payment_List_screen.dart';
import './screens/Test_screen.dart';
import './screens/AddFavouritePayment.dart';
import './screens/Home_screen.dart';
import './screens/History_screen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/services.dart';
import 'screens/Login_Screen.dart';
import './screens/Change_password_screen.dart';
import './screens/Device_management_screen.dart';
import './screens/Pin_login_screen.dart';
import 'screens/Update_favorite_beneficiary.dart';

import 'globals.dart' as globals;

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

class _MyHomePageState extends State<MyApp> with WidgetsBindingObserver {
// with WidgetsBindingObserver
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      globals.isLoggedIn = false;
      navigatorKey.currentState.pushNamed('/pin_login');
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Peoples Redde App',
      theme: ThemeData(
        primaryColor: Color(0xFF212121),
        accentColor: Color(0xFFfbb418),
      ),
      home: AnimatedSplashScreen(
        splash: Image.asset('assets\\images\\peoples-bank.png'),
        nextScreen: globals.isLoggedIn ? LoginScreen() : PinLogin(),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Color(0xFF424242),
        duration: 3500,
      ),
      initialRoute: '/',
      routes: {
        PinLogin.routeName: (context) => PinLogin(),
        LoginScreen.routeName: (context) => LoginScreen(),
        DeviceManagement.routeName: (context) => DeviceManagement(),
        ChangePassword.routeName: (context) => ChangePassword(),
        TabsScreen.routeName: (context) => TabsScreen(),
        FavouriteScreen.routeName: (context) => FavouriteScreen(),
        TransferScreen.routeName: (context) => TransferScreen(),
        SettingsScreen.routeName: (context) => SettingsScreen(),
        TestScreen.routeName: (context) => TestScreen(),
        PaymentListScreen.routeName: (context) => PaymentListScreen(),
        AddFavouritePayment.routeName: (context) => AddFavouritePayment(),
        FavoriteIntraBankBeneficiary.routeName: (context) =>
            FavoriteIntraBankBeneficiary(),
        FavoriteInterBankBeneficiary.routeName: (context) =>
            FavoriteInterBankBeneficiary(),
        AddFavoriteBeneficiary.routeName: (context) => AddFavoriteBeneficiary(),
        UpdateFavoriteBeneficiary.routeName: (context) =>
            UpdateFavoriteBeneficiary(),
        HomeScreen.routeName: (context) => HomeScreen(),
        HistoryScreen.routeName: (context) => HistoryScreen(),
        Acknowledgement.routeName: (context) => Acknowledgement()
      },
    );
  }
}
