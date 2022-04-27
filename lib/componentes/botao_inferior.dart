import 'package:flutter/material.dart';

import 'package:imccalc_flutter/constantes.dart';

class Botaoinferior extends StatelessWidget {
  Botaoinferior({@required this.aoPressionar, @required this.tituloBotao});

  final Function aoPressionar;
  final String tituloBotao;
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: aoPressionar, 
      child: Container(
        child: Center(
          child: Text(
            tituloBotao,
            style: kBotaoGrandeTextStyle,
          ),
        ),
        color: kCorContainerInferior,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 20.0),
        width: double.infinity,
        height: kAlturaContainerInferior,
      ),
    );
  }
}