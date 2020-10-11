import 'package:flutter/material.dart'; //SettingsScreen

class SettingsScreen extends StatefulWidget {
  static const routeName = '/settings';
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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
          actions: [
            //AppBarActions()

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
          ],
          bottom: PreferredSize(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Settings',
                      style: TextStyle(color: Colors.white, fontSize: 15.0),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Color(0xFF424242),
                ),
              ),
              preferredSize: Size.fromHeight(50.0)),
        ),
        body:
            // Center(
            // child:
            Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Card(
              child: InkWell(
                onTap: () {
                  print('onchange password pressed');
                  Navigator.pushNamed(context, '/changePassword');
                },
                child: Column(mainAxisSize: MainAxisSize.min,
                    //   onTap: () {
                    //   print('Card tapped.');
                    // },
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: ListTile(
                          leading: Icon(Icons.enhanced_encryption,
                              color: Colors.pink, size: 38.0),
                          title: Text('Change Password'),
                          subtitle: Text(
                              'Change your People\'s Wave account password. In order to change your password you need to verify your mobile number using OTP '),
                        ),
                      )
                    ]),
              ),
            ),
            new Card(
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/deviceManagement');
                },
                child: Column(mainAxisSize: MainAxisSize.min,
                    //   onTap: () {
                    //   print('Card tapped.');
                    // },
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: ListTile(
                          leading: Icon(Icons.devices,
                              color: Colors.pink, size: 38.0),
                          title: Text('Device Management'),
                          subtitle: Text(
                              'You can view list of registered devices to use this app and remove access to the currently logged in device'),
                        ),
                      )
                    ]),
              ),
            ),
            Container(
                // height: 200,
                padding: EdgeInsets.symmetric(vertical: 2.0),
                alignment: Alignment.center,
                child: new Card(
                  child: InkWell(
                    onTap: () {
                      print('card3 pressed');
                    },
                    child: Column(
                        // mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: ListTile(
                              leading: Icon(Icons.sms,
                                  color: Colors.pink, size: 38.0),
                              title: Text('SMS alert registration'),
                              subtitle: Text(
                                  'Get up-to date account balance information and monitor your transaction history via Peopl\'s Wave mobile banking app'),
                              // dense: true,
                            ),
                          )
                        ]),
                  ),
                ))
          ],
        )
        // ),
        );
  }
}
