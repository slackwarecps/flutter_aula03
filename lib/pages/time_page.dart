import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste222/models/time.dart';
import 'package:teste222/models/titulo.dart';
import 'package:teste222/pages/add_titulo_page.dart';
import 'package:teste222/repositories/times_repository.dart';

class TimePage extends StatefulWidget {
  final Time time; // Tornar a variável `time` final para indicar que ela não será alterada após a inicialização.

  // Usar `required` no construtor para garantir que o parâmetro `time` seja sempre fornecido.
  const TimePage({super.key, required this.time});

  @override
  State<TimePage> createState() => _TimePageState();
}

class _TimePageState extends State<TimePage> {

//on click do Botao Add
tituloPage(){
  Navigator.push(context, MaterialPageRoute(
    builder: (_)=> AddTituloPage( time: widget.time ),
  ),
  );
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

    //inicializa o provider e filtra o resultado.
    final time = Provider.of<TimesRepository>(context)
        .times
        .firstWhere((t)=>t.nome ==widget.time.nome);

    final quantidade = time.titulos.length;

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
        
        return ListTile(
          leading: const Icon(Icons.emoji_events),
          title: Text(time.titulos[index].campeonato),
          subtitle: Text('Ano: ${time.titulos[index].ano}'),
        );
      },
      separatorBuilder: (_, __) => const Divider(),
    );
  }


}