import 'package:flutter/material.dart';
import 'package:imccalc_flutter/telas/tela_principal.dart';

void main() => runApp(CalculadoraIMC());

class CalculadoraIMC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF616161),
        scaffoldBackgroundColor: Color(0xFF616161) ,
  ),
      home: TelaPrincipal(
        
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

