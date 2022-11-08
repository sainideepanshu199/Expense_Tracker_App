// ignore_for_file: missing_required_param, unnecessary_import

import 'package:flutter/material.dart';
import '../widgets/transaction_item.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  const TransactionList(
    this.transactions,
    this.deleteTx,
  );
  @override
  Widget build(BuildContext context) {
    print('build() TransactionListState');
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: <Widget>[
                Text(
                  'No Transactions added yet!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/empty_list.webp',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          })
        : SizedBox(
            height: 300,
            child: ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (ctx, index) {
                return Transaction_item(
                    transaction: transactions[index], deleteTx: deleteTx);
              },
            ),
          );
  }
}
