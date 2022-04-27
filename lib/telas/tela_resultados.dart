import 'package:flutter/material.dart';

import '../componentes/cartao_padrao.dart';
import 'package:imccalc_flutter/componentes/botao_inferior.dart';
import '../constantes.dart';

class TelaResultados extends StatelessWidget {

  TelaResultados({@required this.resultadoIMC, @required this.resultadoTexto, @required this.interpretacao});

  final String resultadoIMC;
  final String resultadoTexto;
  final String interpretacao;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CALCULADORA IMC'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Resultado',
                style: KTituloTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: CartaoPadrao(
              cor: kCorAtivaCartaoPadrao,
              filhoCartao: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultadoTexto.toUpperCase(),
                    style: kResultadosTextStyle,
                  ),
                  Text(
                    resultadoIMC,
                    style: kIMCTextStyle,
                  ),
                  Text(
                    interpretacao,
                    textAlign: TextAlign.center,
                    style: kCorpoTextStyle,
                  ),
                ],
              ),
            ),
          ),
          Botaoinferior(
            tituloBotao: 'RECALCULAR',
            aoPressionar: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
