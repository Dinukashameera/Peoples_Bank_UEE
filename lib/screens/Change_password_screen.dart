import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  static const routeName = '/changePassword';

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
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
                    'Change Password',
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
      body: Padding(
        padding: EdgeInsets.fromLTRB(
            MediaQuery.of(context).size.width / 15,
            MediaQuery.of(context).size.height / 30,
            MediaQuery.of(context).size.width / 15,
            MediaQuery.of(context).size.height / 15),
        child: ChangePasswordForm(),
      ),
    );
  }
}

//         Change password form

class ChangePasswordForm extends StatefulWidget {
  @override
  _ChangePasswordFormState createState() => _ChangePasswordFormState();
}

class _ChangePasswordFormState extends State<ChangePasswordForm> {
  final _formKey = GlobalKey<FormState>();
  final toAccNumController = TextEditingController();
  final beneficiaryNameController = TextEditingController();
  final transferAmountController = TextEditingController();
  final beneficiaryContactNumController = TextEditingController();
  final noteController = TextEditingController();
  TextEditingController fromAccountController = TextEditingController();
  TextEditingController toAccountBranchController = TextEditingController();

  String selectedValue;
  String selectedFromAccNum;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    toAccNumController.dispose();
    beneficiaryNameController.dispose();
    transferAmountController.dispose();
    beneficiaryContactNumController.dispose();
    noteController.dispose();
    fromAccountController.dispose();
    toAccountBranchController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
//----------------------------------------------------------------------------//
          SizedBox(
            height: MediaQuery.of(context).size.height / 5,
          ),

          Padding(
            padding: EdgeInsets.fromLTRB(
                0, 0, 0, MediaQuery.of(context).size.height / 40),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          0, 0, 0, MediaQuery.of(context).size.height / 120),
                    ),
                  ],
                ),
                TextFormField(
                  onEditingComplete: () {
                    FocusScope.of(context).nextFocus();
                  },
                  autofocus: false,
                  controller: toAccNumController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Old Password",
                      // hintText: '783522398924',
                      prefixIcon: Icon(Icons.account_balance),
                      border: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5))),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height / 50,
                          horizontal: MediaQuery.of(context).size.width / 25)),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter To account number!';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
//----------------------------------------------------------------------------//
          Padding(
            padding: EdgeInsets.fromLTRB(
                0, 0, 0, MediaQuery.of(context).size.height / 40),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          0, 0, 0, MediaQuery.of(context).size.height / 120),
                    ),
                  ],
                ),
                TextFormField(
                  onEditingComplete: () {
                    FocusScope.of(context).nextFocus();
                  },
                  autofocus: false,
                  controller: beneficiaryNameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: "New Password",
                      // hintText: 'Amal Udayakantha',
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5))),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height / 50,
                          horizontal: MediaQuery.of(context).size.width / 25)),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter beneficiary\'s name!';
                    } else if (RegExp('[^a-zA-Z\.\" \"]')
                        .hasMatch(beneficiaryNameController.text)) {
                      return 'Beneficiary\'s name allows letters only!';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
//----------------------------------------------------------------------------//
          Padding(
            padding: EdgeInsets.fromLTRB(
                0, 0, 0, MediaQuery.of(context).size.height / 40),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          0, 0, 0, MediaQuery.of(context).size.height / 120),
                    ),
                  ],
                ),
                TextFormField(
                  onEditingComplete: () {
                    FocusScope.of(context).nextFocus();
                  },
                  autofocus: false,
                  controller: transferAmountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Re-enter Password",
                      // hintText: '12500',
                      // prefixText: 'LKR. ',
                      prefixIcon: Icon(Icons.attach_money),
                      border: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5))),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height / 50,
                          horizontal: MediaQuery.of(context).size.width / 25)),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter transfer amount!';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
//----------------------------------------------------------------------------//
          SizedBox(
            height: MediaQuery.of(context).size.height / 20,
          ),
          ButtonTheme(
            minWidth: MediaQuery.of(context).size.width * 0.35,
            height: MediaQuery.of(context).size.width * 0.12,
            child: RaisedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  // _onButtonPressed();
                }
              },
              child: Text(
                'Verify',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              color: Color(0xFF212121),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
            ),
          )
//----------------------------------------------------------------------------//
        ],
      ),
    );
  }
}

//             Change Password form ends
