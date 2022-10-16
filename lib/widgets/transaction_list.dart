import 'package:flutter/material.dart';
// ignore: unnecessary_import
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatefulWidget {
  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  // ignore: unused_field
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: 'shoes',
      amount: 80,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'groceries',
      amount: 200,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _userTransactions.map((tx) {
        return Card(
            child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              decoration: BoxDecoration(
                  border: Border.all(
                color: Colors.purpleAccent,
                width: 3,
              )),
              padding: EdgeInsets.all(8),
              child: Text('\$${tx.amount}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      fontStyle: FontStyle.normal,
                      color: Colors.purpleAccent)),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(
                      color: Colors.orange,
                      width: 3,
                      style: BorderStyle.solid)),
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tx.title,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    DateFormat.yMMMd().format(tx.date),
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
                //tostring() is used to convert other data type to string.
              ),
            )
          ],
        ));
      }).toList(),
    );
  }
}
