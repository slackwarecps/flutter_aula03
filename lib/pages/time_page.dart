import 'package:flutter/material.dart';
import 'package:teste222/models/time.dart';
import 'package:teste222/models/titulo.dart';
import 'package:teste222/pages/add_titulo_page.dart';

class TimePage extends StatefulWidget {
  final Time time; // Tornar a variável `time` final para indicar que ela não será alterada após a inicialização.

  // Usar `required` no construtor para garantir que o parâmetro `time` seja sempre fornecido.
  const TimePage({super.key, required this.time});

  @override
  State<TimePage> createState() => _TimePageState();
}

class _TimePageState extends State<TimePage> {

tituloPage(){
  Navigator.push(context, MaterialPageRoute(
    builder: (_)=> AddTituloPage( time: widget.time, onSave:addTitulo ),
  ),
  );
}

addTitulo(Titulo titulo){
  setState(() {
    widget.time.titulos.add(titulo);
  });

  Navigator.pop(context);

  ScaffoldMessenger.of(context)
    .showSnackBar(const SnackBar(content: Text('Salvo com sucesso!')));
}


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: widget.time.cor,
          title: Text(widget.time.nome),
          actions: [IconButton(icon: const Icon(Icons.add), onPressed: tituloPage)],
          bottom: const TabBar(tabs:[
             Tab(
            icon: Icon(Icons.stacked_line_chart),
            text: 'Estatisticas',
              ),
            Tab(
            icon: Icon(Icons.stacked_line_chart),
            text: 'Titulos',
              ),
          ],indicatorColor: Colors.white,),
        ),
        body: TabBarView(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(24), 
                child: Image.network(widget.time.brasao),
              ),
              Text('Pontos: ${widget.time.pontos}',style: const TextStyle(fontSize: 22),)
            ],
          ),
          _buildTitulosTab(),
        ]),      
      ),
    );
  }


  // Método para construir a aba de títulos
  Widget _buildTitulosTab() {
    final quantidade = widget.time.titulos.length;

    if (quantidade == 0) {
      return const Center(
        child: Text(
          'Nenhum título ainda',
          style: TextStyle(fontSize: 18),
        ),
      );
    }

    return ListView.separated(
      itemCount: quantidade,
      itemBuilder: (BuildContext context, int index) {
        final titulo = widget.time.titulos[index];
        return ListTile(
          leading: const Icon(Icons.emoji_events),
          title: Text(titulo.campeonato),
          subtitle: Text('Ano: ${titulo.ano}'),
        );
      },
      separatorBuilder: (_, __) => const Divider(),
    );
  }


}