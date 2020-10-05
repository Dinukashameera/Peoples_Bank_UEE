import 'package:flutter/material.dart';
import 'package:flushbar/flushbar.dart';

class DeviceManagement extends StatefulWidget {
  static const routeName = '/deviceManagement';

  @override
  _DeviceManagementState createState() => _DeviceManagementState();
}

class _DeviceManagementState extends State<DeviceManagement> {
  final deviceList = [
    {
      'id': '001',
      'name': 'Samsung Galaxxy Note 20 Ultra 5G',
      'description': 'Registered on 2020-08-30'
    },
    {
      'id': '002',
      'name': 'Huawei Nova 5T',
      'description': 'Registered on 2019-06-26'
    },
    {
      'id': '003',
      'name': 'Apple Iphone 11 Pro Max',
      'description': 'Registered on 2019-12-13'
    },
    {
      'id': '004',
      'name': 'Huawei P40 Pro',
      'description': 'Registered on 2020-09-30'
    },
    {
      'id': '005',
      'name': 'Apple Iphone 8',
      'description': 'Registered on 2015-05-18'
    },
  ];

  void onDeleteConfirm(data) {
    deviceList.removeWhere((element) => '${element['id']}' == '${data['id']}');
    setState(() {});
    Navigator.pop(context);
    Flushbar(
        flushbarPosition: FlushbarPosition.BOTTOM,
        message: "Selected device was removed successfully!",
        duration: Duration(seconds: 2),
        isDismissible: true)
      ..show(context);
  }

  // void _showToast(BuildContext context) {
  //   final scaffold = Scaffold.of(context);
  //   scaffold.showSnackBar(
  //     SnackBar(
  //       content: const Text('Updating..'),
  //     ),
  //   );
  // }

  void _onDeletePressed(data) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            color: Color(0xFF737373),
            height: MediaQuery.of(context).size.height * 0.32,
            child: Container(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 30, bottom: 3),
                      child: Icon(
                        Icons.warning,
                        size: 40.0,
                      ),
                    ),
                    Container(
                        child: Text(
                      'Do you want to remove this device?',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        '${data['name']}',
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                          // branch,
                          '${data['description']}',
                          style: TextStyle(
                              fontSize: 13.0, color: Color(0xFFbdbdbd))),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ButtonTheme(
                            minWidth: 120.0,
                            child: RaisedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Cancel'),
                              color: Color(0xFF757575),
                              textColor: Colors.white,
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          ButtonTheme(
                            minWidth: 120.0,
                            child: RaisedButton(
                              onPressed: () async {
                                onDeleteConfirm(data);
                              },
                              child: Text('Delete'),
                              color: Color(0xFFc8262c),
                              textColor: Colors.white,
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(40),
                  topRight: const Radius.circular(40),
                ),
              ),
            ),
          );
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
                    'Device Management',
                    style: TextStyle(color: Colors.white, fontSize: 15.0),
                  ),
                  Text(
                    'check and remove unrecognized devies registered for this account',
                    style: TextStyle(color: Colors.white54, fontSize: 11.0),
                  )
                ],
              ),
              decoration: BoxDecoration(
                color: Color(0xFF424242),
              ),
            ),
            preferredSize: Size.fromHeight(50.0)),
      ),
      // body: ListView(children: const <Widget>[
      //   Padding(padding: EdgeInsets.only(top: 10.0)),
      //   Card(
      //       child: ListTile(
      //           title: Text('You can only have maxximum number of 5 devices',
      //               style: TextStyle(
      //                   fontSize: 14.0,
      //                   fontWeight: FontWeight.bold,
      //                   color: Colors.black54)),
      //           subtitle: Text(
      //               'You can remove unrecognized devices or unwanted devices from the list below.'))),

      // ]),

      body: Column(
        children: <Widget>[
          Card(
              child: ListTile(
                  title: Text('You can only have maxximum number of 5 devices',
                      style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54)),
                  subtitle: Text(
                      'You can remove unrecognized devices or unwanted devices from the list below.'))),
          //......................//
          // GestureDetector(
          //   child: Card(
          //     child: ListTile(
          //       title: Text('Two-line ListTile'),
          //       subtitle: Text('Here is a second line'),
          //       trailing: PopupMenuButton(
          //         icon: Icon(Icons.more_vert),
          //         itemBuilder: (_) => [
          //           PopupMenuItem(
          //               child: GestureDetector(
          //             child: Text('Delete'),
          //             onTap: () {
          //               Navigator.pop(context);

          //               // _onButtonPressed();
          //             },
          //           )),
          //         ],
          //       ),
          //     ),
          //   ),
          // )

          ///test
          // Expanded(
          //   child: GridView.count(
          //     // childAspectRatio: 1,
          //     crossAxisCount: 1,
          //     children: deviceList
          //         .map((device) => Card(
          //               child: ListTile(
          //                 title: Text('${device["name"]}'),
          //                 subtitle: Text('text2'),
          //               ),
          //             ))
          //         .toList(),
          //   ),
          // )

          GestureDetector(
            child: Column(
              children: deviceList
                  .map((device) => Padding(
                      padding: EdgeInsets.only(top: 5.0),
                      child: Card(
                        child: ListTile(
                            title: Text('${device["name"]}'),
                            subtitle: Text('${device["description"]}'),
                            trailing: PopupMenuButton(
                              //         icon: Icon(Icons.more_vert),
                              itemBuilder: (_) => [
                                PopupMenuItem(
                                  value: device,
                                  // child: GestureDetector(
                                  child: Text('Delete'),
                                  // onTap: () {
                                  //   // Navigator.pop(context);

                                  //   _onDeletePressed(device);
                                  // },
                                  // )
                                ),
                              ],
                              onSelected: (d) {
                                _onDeletePressed(d);
                              },
                            )),
                      )))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
