import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:peoples_bank/custom_icons_icons.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flushbar/flushbar.dart';

class ChangePassword extends StatefulWidget {
  static const routeName = '/changePassword';

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
//   void confirmOtp() {
//   setState(() {});
//     Navigator.pop(context);
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomPadding: false,
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
  // final toAccNumController = TextEditingController();
  // final beneficiaryNameController = TextEditingController();
  // final transferAmountController = TextEditingController();
  // final beneficiaryContactNumController = TextEditingController();
  // final noteController = TextEditingController();
  TextEditingController oldPwdController = TextEditingController();
  TextEditingController newPwdController = TextEditingController();
  TextEditingController reEnterPwdController = TextEditingController();

  String selectedValue;
  String selectedFromAccNum;

  @override
  // void dispose() {
  //   // Clean up the controller when the widget is disposed.
  //   toAccNumController.dispose();
  //   beneficiaryNameController.dispose();
  //   transferAmountController.dispose();
  //   beneficiaryContactNumController.dispose();
  //   noteController.dispose();
  //   fromAccountController.dispose();
  //   toAccountBranchController.dispose();

  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
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
                    obscureText: true,
                    autofocus: false,
                    controller: oldPwdController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: "Old Password",
                        prefixIcon: Icon(Icons.keyboard),
                        border: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5))),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.height / 50,
                            horizontal:
                                MediaQuery.of(context).size.width / 25)),
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'this filed is required')
                    ]),
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
                    obscureText: true,
                    onEditingComplete: () {
                      FocusScope.of(context).nextFocus();
                    },
                    autofocus: false,
                    controller: newPwdController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: "New Password",
                        prefixIcon: Icon(Icons.vpn_key),
                        border: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5))),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.height / 50,
                            horizontal:
                                MediaQuery.of(context).size.width / 25)),
                    validator: MultiValidator([
                      MinLengthValidator(5,
                          errorText: 'password must be at least 5 digits long'),
                      MaxLengthValidator(8,
                          errorText: 'this should not exceed 8 charactors'),
                      PatternValidator(r'(?=.*?[#?!@$%^&*-])',
                          errorText:
                              'passwords must have at least one special character')
                    ]),
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
                    obscureText: true,
                    onEditingComplete: () {
                      FocusScope.of(context).nextFocus();
                    },
                    autofocus: false,
                    controller: reEnterPwdController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: "Re-enter Password",
                        prefixIcon: Icon(Icons.vpn_key),
                        border: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5))),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.height / 50,
                            horizontal:
                                MediaQuery.of(context).size.width / 25)),
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'this field is required'),
                      MinLengthValidator(5, errorText: 'length does not match'),
                      MaxLengthValidator(8, errorText: 'length does not match'),
                    ]),
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
                    Alert(
                        context: context,
                        title: "Confirm with OTP",
                        content: Column(
                          children: <Widget>[
                            TextField(
                              keyboardType: TextInputType.number,
                              maxLength: 4,
                              decoration: InputDecoration(
                                  icon: Icon(Icons.enhanced_encryption),
                                  labelText: 'OTP Validation',
                                  hintText: '4 number digit you recieved'),
                            ),
                          ],
                        ),
                        buttons: [
                          DialogButton(
                            onPressed: () => {
                              oldPwdController.text = '',
                              newPwdController.text = '',
                              reEnterPwdController.text = '',
                              Navigator.pop(context),
                              Flushbar(
                                  flushbarPosition: FlushbarPosition.BOTTOM,
                                  message: "Password updated successfully!",
                                  duration: Duration(seconds: 3),
                                  isDismissible: true)
                                ..show(context)
                            },
                            child: Text(
                              "Validate",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          )
                        ]).show();
                  }
                },
                child: Text(
                  'Verify',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                color: Color(0xFF212121),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
              ),
            )
//----------------------------------------------------------------------------//
          ],
        ),
      ),
    );
  }
}

//             Change Password form ends
