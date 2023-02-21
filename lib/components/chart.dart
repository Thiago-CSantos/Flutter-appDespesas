import 'package:expenses/components/chart_bar.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  const Chart(this.transacoesRecentes, {super.key});

  final List<Transaction> transacoesRecentes;

  List<Map<String, Object>> get groupedTransaction {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      double totalSum = 0.0;

      for (var i = 0; i < transacoesRecentes.length; i++) {
        bool sameDay = transacoesRecentes[i].date.day == weekDay.day;
        bool sameMonth = transacoesRecentes[i].date.month == weekDay.month;
        bool sameYear = transacoesRecentes[i].date.year == weekDay.year;

        if (sameDay && sameMonth && sameYear) {
          totalSum += transacoesRecentes[i].value;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay)[0],
        'value': totalSum,
      };
    }).reversed.toList();
  }

  double get _valorTotalSemana {
    return groupedTransaction.fold(0.0, (acc, item) {
      return acc + (item['value'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransaction.map((e) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                  label: e['day'] as String,
                  value: e['value'] as double,
                  percentage: _valorTotalSemana == 0
                      ? 0
                      : (e['value'] as double) / _valorTotalSemana),
            );
          }).toList(),
        ),
      ),
    );
  }
}
