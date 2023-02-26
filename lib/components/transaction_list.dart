import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransActionList extends StatelessWidget {
  const TransActionList(this.transaction, this.onRemove, {super.key});

  final List<Transaction> transaction;
  final void Function(String) onRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      child: transaction.isEmpty
          ? LayoutBuilder(
              builder: (ctx, altura) {
                return Column(
                  children: [
                    const Text('Nenhuma transação cadastrada'),
                    SizedBox(
                      height: altura.maxHeight * 0.01,
                    ),
                    SizedBox(
                      height: altura.maxHeight * 0.6,
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                );
              },
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
                        padding: const EdgeInsets.all(0),
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
                    trailing: MediaQuery.of(context).size.width > 500
                        ? TextButton.icon(
                            onPressed: () {
                              onRemove(tr.id);
                            },
                            icon: const Icon(Icons.delete_sweep_outlined),
                            label: Text(
                              'Excluir',
                              style: TextStyle(color: Colors.purple[900]),
                            ),
                          )
                        : IconButton(
                            icon: const Icon(Icons.delete_sweep_outlined),
                            onPressed: () {
                              onRemove(tr.id);
                            },
                          ),
                  ),
                );
              }),
    );
  }
}
