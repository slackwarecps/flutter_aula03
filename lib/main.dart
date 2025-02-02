import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'package:teste222/repositories/times_repository.dart';
import 'pages/home_page.dart';


void main() {
  runApp(
    ChangeNotifierProvider(create: (context)=>TimesRepository(),
    child:MeuAplicativo() ,
  ));
}



class MeuAplicativo extends StatelessWidget {
  const MeuAplicativo({super.key});

 
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Fabio Pereira',
      debugShowCheckedModeBanner:false,
      theme: ThemeData(
        primaryColor: Colors.green,visualDensity: VisualDensity.adaptivePlatformDensity),
      home: HomePage(),
      
    );
  }
}