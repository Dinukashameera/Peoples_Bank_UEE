import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:peoples_bank/dummy_data/Data.dart';

class IntrabankTransferScreen extends StatelessWidget {
  static const routeName = '/intraBankTransfer';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Intra Bank Fund Transfer',
                    style: TextStyle(color: Colors.white, fontSize: 15.0),
                  ),
                  Text(
                    'Transfer fund between Peoples\'s Bank Branches',
                    style: TextStyle(color: Colors.white54, fontSize: 11.0),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Color(0xFF424242),
              ),
            ),
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
  final toAccNumController = TextEditingController();
  final beneficiaryNameController = TextEditingController();
  final transferAmountController = TextEditingController();
  final beneficiaryContactNumController = TextEditingController();
  final noteController = TextEditingController();
  TextEditingController fromAccountController = TextEditingController();

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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.

    fromAccountController =
        TextEditingController(text: FromAccountNumberService.accNumbers[0]);

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
                TypeAheadFormField(
                  textFieldConfiguration: TextFieldConfiguration(
                    onEditingComplete: () {
                      FocusScope.of(context).nextFocus();
                    },
                    decoration: InputDecoration(
                        labelText: "From Account Numebr",
                        hintText: '783522398924',
                        prefixIcon: Icon(Icons.account_balance),
                        border: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5))),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.height / 50,
                            horizontal:
                                MediaQuery.of(context).size.width / 25)),
                    controller: this.fromAccountController,
                  ),
                  suggestionsCallback: (pattern) {
                    return FromAccountNumberService.getSuggestions(pattern);
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
                    this.fromAccountController.text = suggestion;
                  },
                  validator: (value) => value.isEmpty
                      ? 'Please enter from account number!'
                      : null,
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
                  controller: toAccNumController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "To Account Numebr",
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
                TextFormField(
                  onEditingComplete: () {
                    FocusScope.of(context).nextFocus();
                  },
                  autofocus: false,
                  controller: transferAmountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Transfer Amount",
                      hintText: '12500',
                      prefixText: 'LKR. ',
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
                  controller: beneficiaryContactNumController,
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
                  controller: noteController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                      labelText: "Note",
                      hintText: 'Purpose of transfer...',
                      prefixIcon: Icon(Icons.note),
                      border: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5))),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height / 50,
                          horizontal: MediaQuery.of(context).size.width / 25)),
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
                  _onButtonPressed();
                }
              },
              child: Text(
                'Transfer',
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

  void _onButtonPressed() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            color: Color(0xFF737373),
            height: MediaQuery.of(context).size.height * 0.38,
            child: Container(
              child: _buildBottomNavigationMenu(),
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

  Column _buildBottomNavigationMenu() {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(
                  0,
                  MediaQuery.of(context).size.height * 0.02,
                  0,
                  MediaQuery.of(context).size.height * 0.01),
              child: IconButton(
                icon: Icon(
                  Icons.error,
                  color: Color(0xFFfbb418),
                ),
                onPressed: null,
                iconSize: MediaQuery.of(context).size.height * 0.1,
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(
                  0, 0, 0, MediaQuery.of(context).size.height * 0.02),
              child: Text(
                'Do you confirm the Transfer?',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width * 0.05),
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Rs. ' + transferAmountController.text,
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                  color: Colors.grey[700]),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              beneficiaryNameController.text,
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                  color: Colors.grey[600]),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(
              0, MediaQuery.of(context).size.height * 0.04, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.height * 0.01),
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
                              fontWeight: FontWeight.w300),
                        ),
                      )
                    ],
                  ),
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.32,
                  decoration: BoxDecoration(
                      color: Colors.grey[600],
                      borderRadius: BorderRadius.circular(40)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);

                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text('Transaction is Processing'),
                    duration: Duration(seconds: 2),
                  ));

                  if (toAccNumController.text == '123456789') {
                    Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text('To Account number is invalid!')));

                    if (transferAmountController.text == '15000') {
                      Scaffold.of(context).showSnackBar(SnackBar(
                          content:
                              Text('Your Account has no sufficient balance!')));
                    }
                  } else if (transferAmountController.text == '15000') {
                    Scaffold.of(context).showSnackBar(SnackBar(
                        content:
                            Text('Your Account has no sufficient balance!')));
                  } else {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text('Transaction is Successfull!'),
                      duration: Duration(seconds: 2),
                    ));

                    toAccNumController.text = '';
                    beneficiaryNameController.text = '';
                    beneficiaryContactNumController.text = '';
                    transferAmountController.text = '';
                    noteController.text = '';
                  }
                },
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.height * 0.01),
                        child: Text(
                          'Confirm',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
                              fontWeight: FontWeight.w300),
                        ),
                      )
                    ],
                  ),
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.32,
                  decoration: BoxDecoration(
                      color: Color(0xFFfbb418),
                      // color: Color(0xFFC8262C),
                      borderRadius: BorderRadius.circular(40)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
