// ignore_for_file: deprecated_member_use, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  DateTime _selectedDate;
  final amountController = TextEditingController();

  void _submitData() {
    if (amountController.text.isEmpty) {
      return;
    }
    final entertedTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (entertedTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }
    widget.addTx(
      entertedTitle,
      enteredAmount,
      _selectedDate,
    );
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => _submitData(),
              // onChanged: (val) {
              //   titleInput = val;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              onSubmitted: (_) => _submitData(),
              // onChanged: (val) => amountInput = val,
            ),
            Container(
              height: 80,
              child: Row(
                children: [
                  Expanded(
                    child: Text(_selectedDate == null
                        ? 'No Date chosen!'
                        : 'picked Date: ${DateFormat.yMMMd().format(_selectedDate)}'),
                  ),
                  FlatButton(
                      textColor: Theme.of(context).primaryColor,
                      onPressed: ((_presentDatePicker)),
                      child: Text(
                        'Choose Date',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ),
            RaisedButton(
              child: Text('Add Transaction'),
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).textTheme.button.color,
              onPressed: _submitData,
            ),
          ],
        ),
      ),
    );
  }
}
