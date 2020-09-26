import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:peoples_bank/dummy_data/Data.dart';

class AddFavoriteBeneficiary extends StatefulWidget {
  static const routeName = '/addBeneficiary';

  @override
  _AddFavoriteBeneficiaryState createState() => _AddFavoriteBeneficiaryState();
}

class _AddFavoriteBeneficiaryState extends State<AddFavoriteBeneficiary> {
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
                    'Add New Beneficiary',
                    style: TextStyle(color: Colors.white, fontSize: 15.0),
                  ),
                  Text(
                    'Add New Beneficiary to Favorite Beneficiaries',
                    style: TextStyle(color: Colors.white54, fontSize: 11.0),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Color(0xFF424242),
              ),
            ),
            preferredSize: Size.fromHeight(50.0)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Container(
            //   width: double.infinity,
            //   padding: EdgeInsets.all(10),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: <Widget>[
            //       Text(
            //         'Favorite Beneficiary Fund Transfer',
            //         style: TextStyle(color: Colors.white, fontSize: 15.0),
            //       ),
            //       Text(
            //         'Transfer fund to Favorite Beneficiaries',
            //         style: TextStyle(color: Colors.white54, fontSize: 11.0),
            //       ),
            //     ],
            //   ),
            //   decoration: BoxDecoration(
            //     color: Color(0xFF424242),
            //   ),
            // ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width / 15,
                  MediaQuery.of(context).size.height / 30,
                  MediaQuery.of(context).size.width / 15,
                  MediaQuery.of(context).size.height / 15),
              child: MyCustomForm(),
            ),
          ],
        ),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  TextEditingController accNumController = TextEditingController();
  TextEditingController beneficiaryNameController = TextEditingController();
  TextEditingController beneficiaryBankController = TextEditingController();
  TextEditingController beneficiaryBranchController = TextEditingController();
  TextEditingController beneficiaryContactNumberController =
      TextEditingController();

  String selectedValue;
  String selectedFromAccNum;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    accNumController.dispose();
    beneficiaryNameController.dispose();
    beneficiaryBankController.dispose();
    beneficiaryBranchController.dispose();
    beneficiaryContactNumberController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.

    final List args = ModalRoute.of(context).settings.arguments;
    final List list = args[0];
    final dynamic refresh = args[1];

    // final newBeneficiary = Beneficiary();

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
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
                      labelText: "Beneficiary Name",
                      hintText: 'Amal Udayakantha',
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
                TypeAheadFormField(
                  textFieldConfiguration: TextFieldConfiguration(
                    onEditingComplete: () {
                      FocusScope.of(context).nextFocus();
                    },
                    decoration: InputDecoration(
                        labelText: "Bank",
                        hintText: 'People\'s Bank',
                        prefixIcon: Icon(Icons.account_balance),
                        border: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5))),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.height / 50,
                            horizontal:
                                MediaQuery.of(context).size.width / 25)),
                    controller: this.beneficiaryBankController,
                  ),
                  suggestionsCallback: (pattern) {
                    return BankNamesServiceTwo.getSuggestions(pattern);
                  },
                  itemBuilder: (context, suggestion) {
                    return SingleChildScrollView(
                      child: ListTile(
                        title: Text(suggestion),
                      ),
                    );
                  },
                  transitionBuilder:
                      (context, suggestionsBox, animationController) =>
                          FadeTransition(
                    child: suggestionsBox,
                    opacity: CurvedAnimation(
                        parent: animationController,
                        curve: Curves.fastOutSlowIn),
                  ),
                  onSuggestionSelected: (suggestion) {
                    this.beneficiaryBankController.text = suggestion;
                  },
                  validator: (value) =>
                      value.isEmpty ? 'Please enter account\'s bank!' : null,
                  onSaved: (value) => this.selectedFromAccNum = value,
                ),
              ],
            ),
          ),
//----------------------------------------------------------------------------//
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
                TypeAheadFormField(
                  textFieldConfiguration: TextFieldConfiguration(
                    onEditingComplete: () {
                      FocusScope.of(context).nextFocus();
                    },
                    decoration: InputDecoration(
                        labelText: "Branch",
                        hintText: 'Akkaraipattu',
                        prefixIcon: Icon(Icons.account_balance),
                        border: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5))),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.height / 50,
                            horizontal:
                                MediaQuery.of(context).size.width / 25)),
                    controller: this.beneficiaryBranchController,
                  ),
                  suggestionsCallback: (pattern) {
                    return BankBranchNameService.getSuggestions(pattern);
                  },
                  itemBuilder: (context, suggestion) {
                    return SingleChildScrollView(
                      child: ListTile(
                        title: Text(suggestion),
                      ),
                    );
                  },
                  transitionBuilder:
                      (context, suggestionsBox, animationController) =>
                          FadeTransition(
                    child: suggestionsBox,
                    opacity: CurvedAnimation(
                        parent: animationController,
                        curve: Curves.fastOutSlowIn),
                  ),
                  onSuggestionSelected: (suggestion) {
                    this.beneficiaryBranchController.text = suggestion;
                  },
                  validator: (value) =>
                      value.isEmpty ? 'Please enter account\'s branch!' : null,
                  onSaved: (value) => this.selectedFromAccNum = value,
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
                  controller: accNumController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Account Number",
                      hintText: '783522398924',
                      prefixIcon: Icon(Icons.account_balance),
                      border: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5))),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height / 50,
                          horizontal: MediaQuery.of(context).size.width / 25)),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter account number!';
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
                  controller: beneficiaryContactNumberController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Beneficiary Contact Number",
                      hintText: '071XXXXXXX',
                      prefixIcon: Icon(Icons.call),
                      border: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5))),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height / 50,
                          horizontal: MediaQuery.of(context).size.width / 25)),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter beneficiary\'s contact number!';
                    } else if (value.length != 10) {
                      return 'Contact number should have only 10 numbers!';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
//----------------------------------------------------------------------------//

          ButtonTheme(
            minWidth: MediaQuery.of(context).size.width * 0.35,
            height: MediaQuery.of(context).size.width * 0.12,
            child: RaisedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  Random random = new Random();

                  String randomID = random.nextInt(999999).toString();

                  String image =
                      'https://ui-avatars.com/api/?size=128&rounded=true&background=4caf50&color=fff&name=' +
                          beneficiaryNameController.text.split(" ")[0] +
                          '+' +
                          beneficiaryNameController.text.split(" ")[1] +
                          '';
                  String intraORinter =
                      beneficiaryBankController.text == 'People\'s Bank'
                          ? 'intra'
                          : 'inter';

                  final newBeneficiary = {
                    "id": randomID,
                    "name": beneficiaryNameController.text,
                    "account": accNumController.text,
                    "branch": beneficiaryBankController.text +
                        ' - ' +
                        beneficiaryBranchController.text,
                    "image": image,
                    "intraORinter": intraORinter,
                    "contact": beneficiaryContactNumberController.text,
                  };

                  list.add(newBeneficiary);

                  var newList = [...list];
                  refresh(newList);

                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text('Beneficiary is added!'),
                    duration: Duration(seconds: 2),
                  ));

                  accNumController.text = '';
                  beneficiaryNameController.text = '';
                  beneficiaryBankController.text = '';
                  beneficiaryBranchController.text = '';
                  beneficiaryContactNumberController.text = '';
                }
              },
              child: Text(
                'Add',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              color: Color(0xFFC8262C),
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
