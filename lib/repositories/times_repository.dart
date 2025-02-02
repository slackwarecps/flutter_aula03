import 'package:flutter/material.dart';
import 'package:teste222/models/time.dart';
import 'package:teste222/models/titulo.dart';

class TimesRepository {
  // Tornar a lista privada e imutável para proteger os dados
  final List<Time> _times = [];

  // Getter para acessar a lista de times de forma segura
  List<Time> get times => List.unmodifiable(_times);

  // Método para adicionar um título a um time específico
  void addTitulo({required Time time, required Titulo titulo}) {
    final index = _times.indexOf(time);
    if (index != -1) {
      _times[index].titulos.add(titulo);
    } else {
      throw Exception('Time não encontrado na lista.');
    }
  }

TimesRepository(){
  _times.addAll([
     
       
     
        Time(
          nome: 'Ponte Preta',
          brasao: 'https://i.imgur.com/0Y1b8Xv.png',
          pontos: 100,
          cor: const Color.fromARGB(255, 102, 102, 103),
        ),        Time(
          nome: 'Flamengo',
          brasao: 'https://i.imgur.com/R7ewqu7.gif',
          pontos: 69, cor: Colors.red,
        ),
        Time(
          nome: 'Guarani',
          brasao: 'https://i.imgur.com/wYTCtRu.jpeg',
          pontos: 10, cor: Colors.green,
        ),
        Time(
          nome: 'Sao Paulo',
          brasao: 'https://i.imgur.com/Ejn0Yvi.gif',
          pontos: 10, cor: Colors.pinkAccent,
        ),
      ]);
}

}