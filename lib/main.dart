import 'dart:math';

import 'package:expenses/components/chart.dart';
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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.purple, accentColor: Colors.purple[700]),
        fontFamily: 'Quicksand',
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
  final List<Transaction> _transaction = [];

  bool _mostrarGrafico = false;

  List<Transaction> get _recentTransactions {
    return _transaction.where((element) {
      return element.date.isAfter(DateTime.now().subtract(
        const Duration(days: 7),
      ));
    }).toList();
  }

  addTrasacao(String title, double value, DateTime data) {
    final novaTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: data,
    );

    setState(() {
      _transaction.add(novaTransaction);
    });

    Navigator.of(context).pop();
  }

  _deleteTransaction(String id) {
    setState(() {
      _transaction.removeWhere((element) {
        return element.id == id;
      });
    });
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
    bool modoPaisagem =
        MediaQuery.of(context).orientation == Orientation.landscape;

    final varAppBar = AppBar(
      title: const Text(
        'Despesas Pessoais',
        style: TextStyle(fontFamily: 'OpenSans', fontSize: 22),
        textAlign: TextAlign.center,
      ),
      centerTitle: true,
      actions: <Widget>[
        if (modoPaisagem == true)
          IconButton(
            icon: Icon(_mostrarGrafico ? Icons.list : Icons.show_chart),
            onPressed: () {
              setState(() {
                _mostrarGrafico = !_mostrarGrafico;
              });
            },
          ),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            _openTransactionFormModal(context);
          },
        ),
      ],
    );

    final calculandoResponsividade = MediaQuery.of(context).size.height -
        varAppBar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: varAppBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (modoPaisagem == true)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  // Switch(
                  //   value: _mostrarGrafico,
                  //   onChanged: (v) {
                  //     setState(() {
                  //       _mostrarGrafico = v;
                  //     });
                  //   },
                  // ),
                ],
              ),
            if (_mostrarGrafico == true || modoPaisagem == false)
              Container(
                height: calculandoResponsividade * (modoPaisagem ? 0.7 : 0.3),
                child: Chart(_recentTransactions),
              ),
            if (_mostrarGrafico == false || modoPaisagem == false)
              Container(
                height: calculandoResponsividade * (modoPaisagem ? 1 : 0.7),
                child: TransActionList(_transaction, _deleteTransaction),
              ),
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
