import 'dart:math';

import 'package:expenses/components/transaction_form.dart';
import 'package:expenses/components/transaction_list.dart';
import 'package:flutter/material.dart';

import '../models/transaction.dart';

class TransActionUsers extends StatefulWidget {
  const TransActionUsers({super.key});

  @override
  State<TransActionUsers> createState() => _TransActionUsersState();
}

class _TransActionUsersState extends State<TransActionUsers> {
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
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransActionForm(addTrasacao),
        TransActionList(_transaction),
      ],
    );
  }
}
