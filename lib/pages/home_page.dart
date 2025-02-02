import 'package:flutter/material.dart';
import 'package:teste222/models/time.dart';
import 'package:teste222/pages/time_page.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var controller;

  @override
  void initState() {
    super.initState();

    controller = HomeController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 229, 202, 234),
        title: const Text('Brasileirao'),
      ),
      body: ListView.separated(
        itemCount: controller.tabela.length,
        itemBuilder: (BuildContext contexto, int time) {
          final List<Time> tabela = controller.tabela;
          return ListTile(
            leading: Image.network(tabela[time].brasao),
            title: Text(tabela[time].nome),
            trailing: Text(tabela[time].pontos.toString()),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => TimePage(
                      key: Key(tabela[time].nome),
                      time: tabela[time],
                    ),
                  ));
            },
          );
        },
        separatorBuilder: (_, ___) => const Divider(),
        padding: const EdgeInsets.all(16),
      ),
    );
  }
}
