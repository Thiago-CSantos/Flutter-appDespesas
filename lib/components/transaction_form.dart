import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransActionForm extends StatefulWidget {
  const TransActionForm(this.onSubmit, {super.key});

  final void Function(String, double, DateTime) onSubmit;

  @override
  State<TransActionForm> createState() => _TransActionFormState();
}

class _TransActionFormState extends State<TransActionForm> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();

  DateTime _selectDate = DateTime.now();

  _selecionarData() {
    var data = DateTime.now();
    showDatePicker(
      context: context, //esse context é recebido pela extends State
      initialDate: DateTime.now(),
      firstDate: DateTime(data.year),
      lastDate: DateTime.now(),
    ).then((depoisEscolher) {
      if (depoisEscolher == null) {
        return;
      } else {
        setState(() {
          _selectDate = depoisEscolher;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 9,
        child: Container(
          margin: EdgeInsets.fromLTRB(
              10, 10, 10, 10 + MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: 'Titulo',
                ),
                onSubmitted: (_) {
                  if (titleController.text.isEmpty) {
                    return;
                  }
                },
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: valueController,
                decoration: const InputDecoration(
                  labelText: 'Valor (R\$)',
                ),
                onSubmitted: (_) {
                  var value = double.tryParse(valueController.text) ?? 0;
                  if (value <= 0) {
                    return;
                  }
                },
              ),
              Container(
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: Text(
                        _selectDate == null
                            ? 'Nenhuma data selecionada'
                            : 'Data: ${DateFormat('dd/MM/yyyy').format(_selectDate!)}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsetsDirectional.fromSTEB(50, 0, 0, 0),
                      child: TextButton(
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Color.fromRGBO(238, 238, 238, 1)),
                          elevation: MaterialStatePropertyAll(1),
                        ),
                        onPressed: _selecionarData,
                        child: const Text(
                          'Selecionar data',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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
                      double value =
                          double.tryParse(valueController.text) ?? 0.0;
                      widget.onSubmit(title, value, _selectDate);
                    },
                    child: const Text('Nova Transação'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
