import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
// import './Tabs_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  // String validatePassword(value) {
  //   if (value.isEmpty) {
  //     return "required";
  //   } else if (value.length < 5) {
  //     // print("len is: " + value.length);
  //     return "password must be at least 5 charactors";
  //   } else if (value.length) {
  //     return "password shoud not exceed 8 charactors";
  //   } else {
  //     return '';
  //   }
  // }
  void login() {
    // final FormState form = formkey.currentState;
    if (formkey.currentState.validate()) {
      Navigator.pushNamed(context, '/tabs_screen');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.all(25.0),
          child: Center(
            // key: formkey,
            child: Form(
                key: formkey,
                // autovalidate: true,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 90.0),
                      child: Image.asset('assets\\images\\peoples-bank.png'),
                    ), //image
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: "Email"),
                      validator: MultiValidator([
                        RequiredValidator(errorText: "Email is required!"),
                        EmailValidator(errorText: 'Not a valid email!')
                      ]),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Password"),
                        validator: MultiValidator([
                          RequiredValidator(errorText: 'password is required'),
                          MinLengthValidator(5,
                              errorText:
                                  'password must be at least 5 digits long'),
                          MaxLengthValidator(8,
                              errorText: 'this should not exceed 8 charactors'),
                          PatternValidator(r'(?=.*?[#?!@$%^&*-])',
                              errorText:
                                  'passwords must have at least one special character')
                        ]),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: 21.0),
                      child: Text(
                        "Forget Password?",
                        style:
                            TextStyle(color: Colors.grey[400].withOpacity(0.8)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16.0),
                      child: Text(
                        "Online Registration",
                        style:
                            TextStyle(color: Colors.grey[400].withOpacity(0.8)),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 23),
                        child: SizedBox(
                          height: 35,
                          width: 115,
                          child: RaisedButton(
                            onPressed: login,
                            //  () {
                            //   if (formkey.currentState.validate()) {
                            //     print('validated');
                            //     Navigator.pushNamed(context, "/addBeneficiary");
                            //   } else {
                            //     print('not validated');
                            //   }
                            // },
                            color: Color(0xFF212121),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            child: Text(
                              'Login',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ))
                  ],
                )),
          )),
    );
  }
}
//emg
// Padding(
//                       padding: EdgeInsets.only(top: 40.0),
//                       child: Text(
//                         "Forget Password?",
//                         style:
//                             TextStyle(color: Colors.grey[400].withOpacity(0.8)),
//                       ),
//                     ),
