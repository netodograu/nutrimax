import 'package:flutter/material.dart';

class BotaoArredondo extends StatelessWidget {
  BotaoArredondo({@required this.icone, @required this.aoPressionar});

  final IconData icone;
  final Function aoPressionar;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icone),
      onPressed: aoPressionar,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF7E7E7E),
    );
  }
}