import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'pagina_inicio.dart';

void main() => runApp(App17());

class App17 extends StatelessWidget {
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        appBarTheme: AppBarTheme(backgroundColor: Color(0xFF0A0E21),
      ),
      ),
      home: PaginaInicio(),
    );
  }
}


