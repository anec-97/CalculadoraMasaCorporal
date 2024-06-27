import 'package:flutter/material.dart';
import 'package:flutter_application_1/constantes.dart';
import 'package:flutter_application_1/tarjeta_reusable.dart';
import 'calcular_resultado.dart';

class PaginaResultados extends StatelessWidget {
  PaginaResultados({required this.imcResultado, required this.textoResultado, required this.textoInterpretado});
  final String imcResultado;
  final String textoResultado;
  final String textoInterpretado;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CALCULADORA IMC'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Text('El resultado es: ', style: kTituloTextStyle),
          ),
          Expanded(
            flex: 5,
            child: TarjetaReusable(
              alPresionar: (){},
              colorido: KColorActivo,
              tarjetaChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(textoResultado.toUpperCase(), style: kResultadoText,),
                  Text(imcResultado.toLowerCase(), style: kIMCTextStyle),
                  Text(textoResultado.toLowerCase(), style: kBodyTextStyle),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}