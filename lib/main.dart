import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(Nada());
}



class Nada extends StatelessWidget {
  const Nada({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fabio Pereira',
      debugShowCheckedModeBanner:false,
      theme: ThemeData(
        primaryColor: Colors.green,visualDensity: VisualDensity.adaptivePlatformDensity),
      home: HomePage(),
      
    );
  }
}