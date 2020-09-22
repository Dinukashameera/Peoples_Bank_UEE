import 'package:flutter/material.dart';

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
            height: 85,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Colors.amber[800],
            child: Text(
              'Mokak hari magulak',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 15,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile(Icons.favorite, "Test Route", () {
            //navigate when code eka gahapan
            //naviagte.pushName
          }),
          buildListTile(Icons.settings, "Methanata items dapan", () {}),
          buildListTile(Icons.payment, "Methanata items dapan", () {}),
          buildListTile(Icons.blur_circular, "Methanata items dapan", () {}),
        ],
      ),
    );
  }
}
