import 'package:flutter/material.dart';
import 'constantes.dart';



class IconoContenido extends StatelessWidget {
  
  IconoContenido({required this.icono, required this.etiqueta});
  final IconData icono;
  final String etiqueta;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icono, size: 60.0),
        SizedBox(height: 15.0),
        Text(etiqueta, style: KEtiquetaTextStyle)
      ],
    );
  }
}