import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar(
      {required this.label,
      required this.percentage,
      required this.value,
      super.key});

  final String label;
  final double value;
  final double percentage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 20,
          child: FittedBox(
            child: Text(value.toStringAsFixed(2)),
          ),
        ),
        const SizedBox(height: 5),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blueGrey,
                    width: 1.0,
                  ),
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              FractionallySizedBox(
                heightFactor: percentage,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 5),
        Text(label)
      ],
    );
  }
}
