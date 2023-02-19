import 'package:flutter/material.dart';

class TransActionForm extends StatefulWidget {
  const TransActionForm(this.onSubmit, {super.key});

  final void Function(String, double) onSubmit;

  @override
  State<TransActionForm> createState() => _TransActionFormState();
}

class _TransActionFormState extends State<TransActionForm> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 9,
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Titulo',
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: valueController,
              decoration: const InputDecoration(
                labelText: 'Valor (R\$)',
              ),
            ),
            Container(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    'Nenhuma data selecionada',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsetsDirectional.fromSTEB(50, 0, 0, 0),
                    child: TextButton(
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.lime),
                        elevation: MaterialStatePropertyAll(1),
                      ),
                      child: const Text(
                        'Selecionar data',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple[600],
                    foregroundColor: Colors.white,
                    elevation: 9,
                  ),
                  onPressed: () {
                    String title = titleController.text;
                    double value = double.tryParse(valueController.text) ?? 0.0;
                    widget.onSubmit(title, value);
                  },
                  child: const Text('Nova Transação'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
