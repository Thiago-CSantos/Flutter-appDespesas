import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransActionList extends StatelessWidget {
  final List<Transaction> transaction;

  const TransActionList(this.transaction, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration:
          BoxDecoration(border: Border.all(color: Colors.blue, width: 3)),
      child: transaction.isEmpty
          ? Column(
              children: [
                const Text('Nenhuma transação cadastrada'),
                Container(
                  color: Colors.blue,
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemCount: transaction.length,
              itemBuilder: (ctx, i) {
                final tr = transaction[i];

                return Card(
                  elevation: 6,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.purple[700],
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: FittedBox(
                          child: Text('R\$: ${tr.value}'),
                        ),
                      ),
                    ),
                    title: Text(
                      tr.title,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      DateFormat('dd/MM/yyyy').format(tr.date),
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              }),
    );
  }
}
