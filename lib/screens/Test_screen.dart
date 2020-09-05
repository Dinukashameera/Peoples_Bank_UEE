import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  static const routeName = '/test';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Some Test Shit'),),
      body: Center(child: Text('Meke mukuth nhe yako '),),
    );
  }
}