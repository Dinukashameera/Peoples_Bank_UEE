// import 'dart:html';

import 'package:flutter/material.dart';
// import '../screens/Settings_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(IconData icon, String title, Function tapHandler,
      subtitleText, trailingIcon) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white70,
        size: 20,
      ),
      title: Text(
        title,
        style: TextStyle(
            color: Colors.white,
            fontFamily: 'RobotoCondensed',
            fontSize: 15,
            fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        subtitleText,
        style: TextStyle(color: Colors.white54),
      ),
      onTap: () {
        tapHandler();
      },
      trailing: Icon(trailingIcon),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xFF424242),
        child: Column(
          children: <Widget>[
            Container(
                height: 200,
                width: double.infinity,
                padding: EdgeInsets.all(20),
                alignment: Alignment.centerLeft,
                color: Colors.grey[900],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        // backgroundImage:
                        //     AssetImage('assets\\images\\peoples-bank.png'),
                        backgroundColor: Colors.brown.shade800,
                        child: Image.asset('assets\\images\\jona.png'),
                        radius: 45.0,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'John Doe',
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.white),
                    ),
                    Text(
                      'johndoe@gmail.com',
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    )
                  ],
                )),
            SizedBox(
              height: 20,
            ),
            buildListTile(Icons.person, "My Profile", () {},
                'Record of your personal information', null),
            Divider(
              thickness: 0.8,
            ),
            buildListTile(Icons.settings, "Settings", () {
              Navigator.pushNamed(context, '/settings');
            }, 'Change your privacy settings of this app', null),
            Divider(
              thickness: 0.8,
            ),
            buildListTile(
                Icons.format_list_bulleted,
                "Orders",
                () {},
                'Any payment or bills can be paid automatically as requested',
                null),
            Divider(
              thickness: 0.8,
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: buildListTile(Icons.keyboard_backspace, "Log Out", () {
                  Navigator.pushNamed(context, '/main_login');
                }, '', null),
              ),
            )
          ],
        ),
      ),
    );
  }
}
