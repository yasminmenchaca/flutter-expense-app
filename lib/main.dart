import 'package:flutter/material.dart';
import './widgets/transaction_list.dart';
import './widgets/new_transaction.dart';
import './models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'See, Spend, Save',
      theme: ThemeData(primarySwatch: Colors.indigo, accentColor: Colors.amber),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // String titleInput;
  // String amountInput;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('See, Spend, Save'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text('Chart'),
                elevation: 5,
              ),
            ),
            TransactionList(_userTransactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
