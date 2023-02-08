import 'dart:math';

import 'package:expenses/components/transaction_form.dart';

import 'package:flutter/material.dart';

import 'components/transaction_list.dart';
import 'models/transaction.dart';

void main(List<String> args) {
  runApp(const ExpensesAPP());
}

class ExpensesAPP extends StatelessWidget {
  const ExpensesAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _transaction = [
    Transaction(
        id: 'T1',
        title: 'Novo tênis de corrida',
        value: 500.56,
        date: DateTime.now()),
    Transaction(
      id: 'T2',
      title: 'Nova camiseta',
      value: 220.30,
      date: DateTime.now(),
    ),
    Transaction(
        id: 'T1',
        title: 'Novo tênis de corrida',
        value: 500.56,
        date: DateTime.now()),
    Transaction(
      id: 'T2',
      title: 'Nova camiseta',
      value: 220.30,
      date: DateTime.now(),
    ),
    Transaction(
        id: 'T1',
        title: 'Novo tênis de corrida',
        value: 500.56,
        date: DateTime.now()),
    Transaction(
      id: 'T2',
      title: 'Nova camiseta',
      value: 220.30,
      date: DateTime.now(),
    ),
    Transaction(
        id: 'T1',
        title: 'Novo tênis de corrida',
        value: 500.56,
        date: DateTime.now()),
    Transaction(
      id: 'T2',
      title: 'Nova camiseta',
      value: 220.30,
      date: DateTime.now(),
    ),
  ];

  addTrasacao(String title, double value) {
    final novaTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transaction.add(novaTransaction);
    });

    Navigator.of(context).pop();
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransActionForm(addTrasacao);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Despesas',
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              _openTransactionFormModal(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              color: Colors.purple.shade100,
              child: const Card(
                elevation: 7,
                color: Colors.blue,
                child: Text('Grafico'),
              ),
            ),
            TransActionList(_transaction),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          _openTransactionFormModal(context);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
