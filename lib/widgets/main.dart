// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/transaction_list.dart';
import './transaction_list.dart';
// ignore: unused_import

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  String titleInput;
  String amountInput;
  //List is based on Transaction class
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Card(
                child: Container(width: 100, height: 120, child: Text('CHART')),
                elevation: 10,
                color: Colors.blue),
            //wrapping text with container to change its size as card depends on child i.e text here  and text depends on its parent class for size.
            Card(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextField(
                      decoration: InputDecoration(labelText: 'Title'),
                      onChanged: (value) {
                        titleInput = value;
                      },
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Amount'),
                      onChanged: (value) {
                        amountInput = value;
                      },
                    ),
                    FlatButton(
                        onPressed: () {
                          print(titleInput);
                          print(amountInput);
                        },
                        child: Text('Add Transaction'),
                        textColor: Colors.green),
                    // TextField widget is responsible for user input
                  ],
                ),
              ),
            ),
            TransactionList(),
          ],
        ));
  }
}
