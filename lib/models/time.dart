// ignore_for_file: public_member_api_docs, sort_constructors_first
// Classe de Times



import 'package:flutter/material.dart';
import 'package:teste222/models/titulo.dart';

class Time {
  String nome;
  String brasao;
  int pontos;
  Color cor;
  List<Titulo> titulos =[];

  Time({
    required this.nome,
    required this.brasao,
    required this.pontos,
    required this.cor,
  });
}
