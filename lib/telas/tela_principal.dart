import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import '../componentes/cartao_padrao.dart';
import '../componentes/botao_arredondado.dart';
import '../componentes/botao_inferior.dart';
import '../componentes/conteudo_icone.dart';
import '../constantes.dart';
import 'tela_resultados.dart';
import 'package:imccalc_flutter/calculadora_imc.dart';

enum Sexo {
  masculino,
  feminino,
}

class TelaPrincipal extends StatefulWidget {
  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  Sexo sexoSelecionado;
  int altura = 180;
  int peso = 60;
  int idade = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CALCULADORA IMC'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CartaoPadrao(
                    aoPressionar: () {
                      setState(() {
                        sexoSelecionado = Sexo.masculino;
                      });
                    },
                    cor: sexoSelecionado == Sexo.masculino
                        ? kCorAtivaCartaoPadrao
                        : kCorInativaCartaoPadrao,
                    filhoCartao: ConteudoIcone(
                      icone: FontAwesomeIcons.mars,
                      descricao: 'MASCULINO',
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        sexoSelecionado = Sexo.feminino;
                      });
                    },
                    child: CartaoPadrao(
                      aoPressionar: () {
                        setState(() {
                          sexoSelecionado = Sexo.feminino;
                        });
                      },
                      cor: sexoSelecionado == Sexo.feminino
                          ? kCorAtivaCartaoPadrao
                          : kCorInativaCartaoPadrao,
                      filhoCartao: ConteudoIcone(
                        icone: FontAwesomeIcons.venus,
                        descricao: 'FEMININO',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: CartaoPadrao(
              cor: kCorAtivaCartaoPadrao,
              filhoCartao: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'ALTURA',
                    style: kDescricaoTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        altura.toString(),
                        style: kNumeroTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kDescricaoTextStyle,
                      )
                    ],
                  ),
                  Slider(
                    activeColor: Color(0xFFFF5822),
                    inactiveColor: Color(0xFF8D8E98),
                    onChanged: (double novoValor) {
                      setState(() {
                        altura = novoValor.round();
                      });
                    },
                    value: altura.toDouble(),
                    min: 120.0,
                    max: 220.0,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CartaoPadrao(
                    cor: kCorAtivaCartaoPadrao,
                    filhoCartao: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'PESO',
                          style: kDescricaoTextStyle,
                        ),
                        Text(
                          peso.toString(),
                          style: kNumeroTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BotaoArredondo(
                              icone: FontAwesomeIcons.minus,
                              aoPressionar: () {
                                setState(() {
                                  peso--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            BotaoArredondo(
                              icone: FontAwesomeIcons.plus,
                              aoPressionar: () {
                                setState(() {
                                  peso++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: CartaoPadrao(
                    cor: kCorAtivaCartaoPadrao,
                    filhoCartao: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'IDADE',
                          style: kDescricaoTextStyle,
                        ),
                        Text(
                          idade.toString(),
                          style: kNumeroTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BotaoArredondo(
                              icone: FontAwesomeIcons.minus,
                              aoPressionar: () {
                                setState(() {
                                  idade--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            BotaoArredondo(
                              icone: FontAwesomeIcons.plus,
                              aoPressionar: () {
                                setState(() {
                                  idade++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Botaoinferior(
            tituloBotao: 'CALCULAR',
            aoPressionar: () {

              CalculadoraIMC calc = CalculadoraIMC(
                altura: altura,
                peso: peso,
              );

              Navigator.push(context, 
              MaterialPageRoute(
                builder: (context) => TelaResultados(
                  resultadoIMC: calc.calcularIMC(),
                  resultadoTexto: calc.obterResultado(),
                  interpretacao: calc.obterInterpretacao(),
                ),
                ),
                );
            },
          ),
        ],
      ),
    );
  }
}




