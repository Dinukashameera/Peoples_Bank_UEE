import 'package:flutter/material.dart';
import '../widgets//paymentSummary.dart';
import 'package:intl/intl.dart';
import '../widgets/appBarActions.dart';

class AddFavouritePayment extends StatefulWidget {
  static final routeName = '/addPayment';
  @override
  _AddFavouritePaymentState createState() => _AddFavouritePaymentState();
}

class _AddFavouritePaymentState extends State<AddFavouritePayment> {
  DateTime _selectedDate;
  TextEditingController dateController = new TextEditingController();
  TextEditingController billTypeController = new TextEditingController();
  TextEditingController accountNumberController = new TextEditingController();
  TextEditingController amountController = new TextEditingController();

  var billDetails = {};

  void _submitData(BuildContext ctx) {
    // print(billTypeController.text.toString());
    // print(accountNumberController.text.toString());
    // print(amountController.text.toString());
    // print(dateController.text.toString());

    billDetails = {
      "type": billTypeController.text.toString(),
      "account": accountNumberController.text.toString(),
      "amount": amountController.text.toString(),
      "date": dateController.text.toString()
    };

    print(billDetails);
    addModal(ctx, billDetails);
  }

  Widget onConfirm(BuildContext ctx) {
    return SnackBar(
      content: Text('Yay! A SnackBar!'),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );
  }

  void addModal(BuildContext context, Map details) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return SingleChildScrollView(
            child: Container(
              color: Color(0xFF737373),
              height: MediaQuery.of(context).size.height * 0.45,
              child: Container(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      // Container(
                      //   margin: EdgeInsets.only(top: 30, bottom: 3),
                      //   child: Icon(
                      //     Icons.warning,
                      //     size: 40.0,
                      //   ),
                      // ),
                      Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 20, top: 20),
                            child: Icon(
                              Icons.close,
                              size: 20.0,
                            ),
                          ),
                        ),
                      ),
                      Container(
                          child: Text(
                        'Payment Summary',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      )),
                      Divider(),

                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20, right: 45, left: 45.0, bottom: 30.0),
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                    'Bill Type',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(details['type'],
                                      style: TextStyle(
                                          fontSize: 13.0,
                                          color: Color(0xFFbdbdbd))),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                    'Account Number',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(details['account'],
                                      style: TextStyle(
                                          fontSize: 13.0,
                                          color: Color(0xFFbdbdbd))),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                    'Amount',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(details['amount'],
                                      style: TextStyle(
                                          fontSize: 13.0,
                                          color: Color(0xFFbdbdbd))),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                    'Transfer Date',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(details['date'],
                                      style: TextStyle(
                                          fontSize: 13.0,
                                          color: Color(0xFFbdbdbd))),
                                ),
                              ],
                            ),
                          ],
                        ),
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
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('Confirm'),
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
            ),
          );
        });
  }

  void _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime.now())
        .then((value) {
      if (value == null)
        return null;
      else {
        setState(() {
          _selectedDate = value;
        });
        dateController.text = DateFormat.yMd().format(value);
      }
    });
  }

  final units = [
    'SLT 4G Bill',
    'SLT Peo TV',
    'SLT Fibre Internet',
    'SLT Router'
  ];


  final _formKey = GlobalKey<FormState>();

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
          actions: [AppBarActions()]),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'ADD BILL PAYMENT',
                        style: TextStyle(color: Colors.white, fontSize: 15.0),
                      ),
                      Text(
                        'You can add your favourite bill  payment here.',
                        style: TextStyle(color: Colors.white54, fontSize: 11.0),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFF424242),
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(top: 50, left: 30, right: 30, bottom: 75),
                  child: Column(
                    children: <Widget>[
                      DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.credit_card),
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 12.0),
                          border: const OutlineInputBorder(),
                        ),
                        // underline: Container(
                        //   height: 1,
                        //   color: Colors.black,
                        // ),

                        hint: Text('Bill Type'),
                        isExpanded: true,
                        onChanged: (String values) {
                          setState(() {
                            // selectedUnit = values;
                          });
                        },

                        items:
                            units.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      TextFormField(
                        controller: accountNumberController,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 0.0, horizontal: 5.0),
                            isDense: true,
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 1.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 1.0),
                            ),
                            labelText: 'Account Number',
                            prefixIcon: Icon(Icons.account_box)),
                        // controller: _amountController,
                        keyboardType: TextInputType.number,
                        // onSubmitted: (_) => _submitData(),
                        // onChanged: (val) => amountInput = val,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'PLease Enter The Account Number';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      TextFormField(
                        controller: amountController,
                        decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 0.0),
                            isDense: true,
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 1.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 1.0),
                            ),
                            labelText: 'Amount',
                            prefixIcon: Icon(Icons.monetization_on)),
                        // controller: _amountController,
                        keyboardType: TextInputType.number,
                        // onSubmitted: (_) => _submitData(),
                        // onChanged: (val) => amountInput = val,
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      TextFormField(
                        controller: dateController,
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 1.0),
                            ),
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 0.0),
                            isDense: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 1.0),
                            ),
                            labelText: 'Date',
                            prefixIcon: Icon(Icons.date_range)),
                        // controller: _amountController,
                        keyboardType: TextInputType.number,
                        readOnly: true,
                        onTap: _showDatePicker,
                        // onSubmitted: (_) => _submitData(),
                        // onChanged: (val) => amountInput = val,
                      ),
                    ],
                  ),
                ),
                ButtonTheme(
                  minWidth: 120.0,
                  height: 40.0,
                  child: RaisedButton(
                    onPressed: () {
                      _submitData(context);
                      print('des');
                    },
                    child: Text(
                      'ADD',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    color: Color(0xFFc8262c),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
