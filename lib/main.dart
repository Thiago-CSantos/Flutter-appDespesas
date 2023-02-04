import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const ExpensesAPP());
}

class ExpensesAPP extends StatelessWidget {
  const ExpensesAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: Colors.purple[700]),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final List<Transaction> _transaction = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Despesas',
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
          const Card(
            elevation: 7,
            child: Text('Lista de Transações'),
          )
        ],
      ),
    );
  }
}
