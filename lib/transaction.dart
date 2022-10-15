import 'package:flutter/material.dart';

class Transaction {
  final String id;
  final String title;
  final double amount;
  final DateTime date;

//properties of transasction class
//creating transaction constructor to use trnasaction class properties and create objects using it.
  Transaction(
      {@required this.id,
      @required this.title,
      @required this.amount,
      @required this.date});
  //named arguments
  // @required is added as all these properties are required
}
