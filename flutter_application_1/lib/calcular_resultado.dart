import 'dart:math';

class CalcularResultado {
  CalcularResultado({required this.alturas, required this.pesos});
  final int alturas;
  final int pesos;
  double _imc=0.0;

  String calcularIMC(){
    _imc = pesos/pow(alturas/100,2);
    return _imc.toStringAsFixed(1);
  }
  String getResultado(){
    if(_imc>=30.0){
      return 'Obesidad';
    } else if (_imc>=25.0){
      return 'Sobrepeso';
    } else if(_imc>=18.5){
      return 'Normal';
    } else {
      return 'Bajo peso';
    }
  }
   
   String getInterpretado(){
    if(_imc>=30.0){
      return 'Tiene un peso muy alto, requiere consultar a un especialista';
    } else if (_imc>=25.0){
      return 'Tiene un peso mayor que el normal, intente hacer más ejercicio';
    } else if(_imc>=18.5){
      return 'Tiene un peso normal, buen trabajo!';
    } else {
      return 'Tiene un peso menor, debe alimentarse mejor!!!';
    }
  }
}