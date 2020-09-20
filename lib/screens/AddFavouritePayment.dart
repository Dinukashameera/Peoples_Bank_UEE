import 'package:flutter/material.dart';
import '../widgets//paymentSummary.dart';
import 'package:intl/intl.dart';

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

  void _submitData(BuildContext ctx){
    // print(billTypeController.text.toString());
    // print(accountNumberController.text.toString());
    // print(amountController.text.toString());
    // print(dateController.text.toString());

    billDetails = {
      "type": billTypeController.text.toString(),
      "account":accountNumberController.text.toString(),
      "amount":amountController.text.toString(),
      "date":dateController.text.toString()
    };

    print(billDetails);
      showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: PaymentSummary(billDetails),
            behavior: HitTestBehavior.opaque,
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
          ]),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                child: Text(
                  'ADD BILL PAYMENT',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
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
                    TextField(
                      controller: billTypeController,
                      decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 0.0),
                          isDense: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 1.0),
                          ),
                          labelText: 'Bill Type',
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.black, width: 1.0),
                          ),
                          prefixIcon: Icon(Icons.monetization_on)),
                      // controller: _amountController,
                      keyboardType: TextInputType.number,
                      // onSubmitted: (_) => _submitData(),
                      // onChanged: (val) => amountInput = val,
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    TextField(
                      controller: accountNumberController,
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
                          labelText: 'Account Number',
                          prefixIcon: Icon(Icons.book)),
                      // controller: _amountController,
                      keyboardType: TextInputType.number,
                      // onSubmitted: (_) => _submitData(),
                      // onChanged: (val) => amountInput = val,
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    TextField(
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
                          prefixIcon: Icon(Icons.branding_watermark)),
                      // controller: _amountController,
                      keyboardType: TextInputType.number,
                      // onSubmitted: (_) => _submitData(),
                      // onChanged: (val) => amountInput = val,
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    TextField(
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
    );
  }
}
