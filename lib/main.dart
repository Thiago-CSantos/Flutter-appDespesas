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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

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
        children: <Widget>[
          Container(
            width: double.infinity,
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
