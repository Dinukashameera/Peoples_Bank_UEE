import 'package:flutter/material.dart';
import 'package:peoples_bank/custom_icons_icons.dart';

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
            // buildListTile(Icons.settings, "Settings", () {
            //   Navigator.pushNamed(context, '/settings');
            // }, 'Change your privacy settings of this app', null),
            // Divider(
            //   thickness: 0.8,
            // ),
            buildListTile(
                CustomIcons.calculator,
                "Pension Calculator",
                () {},
                'Free money advice service pension calculator to estimate your retirement income',
                null),
            Divider(
              thickness: 0.8,
            ),
            buildListTile(
                CustomIcons.money,
                "Cheque service",
                () {},
                'we offer you Speedy, reliable and confidential service while giving maximum security',
                null),
            Divider(
              thickness: 0.8,
            ),
            buildListTile(
                CustomIcons.money_bill_alt,
                "Pawing service",
                () {},
                'we offer you Speedy, reliable and confidential service while giving maximum security',
                null),
            Divider(
              thickness: 0.8,
            ),
            buildListTile(Icons.settings, "Settings", () {
              Navigator.pushNamed(context, '/settings');
            }, 'Change your privacy settings of this app', null),
            Divider(
              thickness: 0.8,
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: buildListTile(CustomIcons.login, "Log Out", () {
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
