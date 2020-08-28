import 'package:flutter/material.dart';
import './new_transaction.dart';
import './transaction_list.dart';
import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: '1',
      title: 'Mechanical Keyboard',
      amount: 87.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: '2',
      title: 'Item 1',
      amount: 43.23,
      date: DateTime.now(),
    ),
    Transaction(
      id: '3',
      title: 'Item 2',
      amount: 43.23,
      date: DateTime.now(),
    ),
    Transaction(
      id: '4',
      title: 'Headphones',
      amount: 3.23,
      date: DateTime.now(),
    ),
    Transaction(
      id: '5',
      title: 'Item 3',
      amount: 33.23,
      date: DateTime.now(),
    ),
    Transaction(
      id: '6',
      title: 'Item 4',
      amount: 43.23,
      date: DateTime.now(),
    ),
    Transaction(
      id: '7',
      title: 'Item 5',
      amount: 43.23,
      date: DateTime.now(),
    ),
    Transaction(
      id: '8',
      title: 'Item 6',
      amount: 43.23,
      date: DateTime.now(),
    )
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
        title: txTitle,
        amount: txAmount,
        date: DateTime.now(),
        id: DateTime.now().toString());

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransactions)
      ],
    );
  }
}
