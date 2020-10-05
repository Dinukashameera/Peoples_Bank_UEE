import 'package:flutter/material.dart';
// import '../screens/Settings_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(IconData icon, String title, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 20,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 15,
            fontWeight: FontWeight.bold),
      ),
      onTap: () {
        tapHandler();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
              height: 200,
              width: double.infinity,
              padding: EdgeInsets.all(20),
              alignment: Alignment.centerLeft,
              color: Colors.black,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      backgroundImage:
                          AssetImage('assets\\images\\peoples-bank.png'),
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
          buildListTile(Icons.person, "My Profile", () {}),
          buildListTile(Icons.settings, "Settings", () {}),
          buildListTile(Icons.format_list_bulleted, "Orders", () {}),
          Expanded(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: buildListTile(Icons.keyboard_backspace, "Log Out", () {}),
            ),
          )
        ],
      ),
    );
  }
}
