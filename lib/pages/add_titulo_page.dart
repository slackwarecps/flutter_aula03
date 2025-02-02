import 'package:flutter/material.dart';
import 'package:teste222/models/time.dart';
import '../models/titulo.dart';

// Pagina/Componente Visual
// pagina de Add Titulo
class AddTituloPage extends StatefulWidget {
  Time time;
  ValueChanged<Titulo> onSave;
  AddTituloPage({super.key, required this.time, required this.onSave});

  @override
  State<AddTituloPage> createState() => _AddTituloPageState();
}

// Controle de Estado
class _AddTituloPageState extends State<AddTituloPage> {
  //Controllers para os campos do formulário
  final _campeonato = TextEditingController();
  final _ano = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.time.cor,
        title: const Text('Adicionar Titulo'),
      ),
      body: Form(
        key: _formKey,
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: TextFormField(
              controller: _ano,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Ano',
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Informe o ano do titulo!';
                }
                if (int.tryParse(value) == null) {
                  return 'Por favor, insira um ano válido.';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            child: TextFormField(
              controller: _campeonato,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Campeonato',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Informe o Campeonato!';
                }
                return null;
              },
            ),
          ),
          Expanded(
              child: Container(
            alignment: Alignment.bottomCenter,
            margin: const EdgeInsets.all(4),
            child: ElevatedButton(
              onPressed: () {

                if(_formKey.currentState!.validate()){
                  widget.onSave(
                      Titulo(campeonato: _campeonato.text, ano: _ano.text)
                  );
                }

              },
              child: const Row(
                children: [
                  Icon(Icons.check),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'Salvar',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ))
        ],
      )),
    );
  }
}
