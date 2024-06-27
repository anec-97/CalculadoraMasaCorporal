import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/pagina_resultado.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icono_contenido.dart';
import 'tarjeta_reusable.dart';
import 'constantes.dart';
import 'pagina_resultado.dart';
import 'calcular_resultado.dart';

enum Genero { hombre, mujer }

class PaginaInicio extends StatefulWidget {
  const PaginaInicio({Key? key}) : super(key: key);

  @override
  State<PaginaInicio> createState() => _PaginaInicioState();
}

class _PaginaInicioState extends State<PaginaInicio> {
  Color colorTarjetaMujer = KColorInactivo;
  Color colorTarjetaHombre = KColorInactivo;
  Genero generoElegido = Genero.mujer;
  int altura = 173;
  int peso = 60;
  int edad = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CALCULAR IMC'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TarjetaReusable(
                    alPresionar: () {
                      setState(() {
                        generoElegido = Genero.hombre;
                      });
                    },
                    colorido: generoElegido == Genero.hombre
                        ? KColorActivo
                        : KColorInactivo,
                    tarjetaChild: IconoContenido(
                      icono: FontAwesomeIcons.mars,
                      etiqueta: 'HOMBRECITO',
                    ),
                  ),
                ),
                Expanded(
                  child: TarjetaReusable(
                    alPresionar: () {
                      setState(() {
                        generoElegido = Genero.mujer;
                      });
                    },
                    colorido: generoElegido == Genero.mujer
                        ? KColorActivo
                        : KColorInactivo,
                    tarjetaChild: IconoContenido(
                      icono: FontAwesomeIcons.venus,
                      etiqueta: "MUJERCITA",
                    ),
                  ),
                ),
              ],
            ),
            TarjetaReusable(
              alPresionar: () {},
              colorido: KColorActivo,
              tarjetaChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('ALTURA', style: KEtiquetaTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(altura.toString(), style: kNumeroTextStyle),
                      Text('cm', style: KEtiquetaTextStyle),
                    ],
                  ),
                  Slider(
                    value: altura.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    activeColor: Color(0xFFEB1555),
                    inactiveColor: Color(0XFF8d8E98),
                    onChanged: (double nuevoValor) {
                      setState(() {
                        altura = nuevoValor.round();
                      });
                    },
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TarjetaReusable(
                    alPresionar: () {},
                    colorido: KColorActivo,
                    tarjetaChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('PESO'),
                        Text(peso.toString(), style: kNumeroTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconoRedondo(
                              iconito: FontAwesomeIcons.minus,
                              alPresionar: () {
                                setState(() {
                                  peso--;
                                });
                              },
                            ),
                            SizedBox(width: 10.0),
                            IconoRedondo(
                              iconito: FontAwesomeIcons.plus,
                              alPresionar: () {
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
                  child: TarjetaReusable(
                    alPresionar: () {},
                    colorido: KColorActivo,
                    tarjetaChild: Column(
                      children: [
                        Text('EDAD'),
                        Text(edad.toString(), style: kNumeroTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconoRedondo(
                              iconito: FontAwesomeIcons.minus,
                              alPresionar: () {
                                setState(() {
                                  edad--;
                                });
                              },
                            ),
                            SizedBox(width: 10.0),
                            IconoRedondo(
                              iconito: FontAwesomeIcons.plus,
                              alPresionar: () {
                                setState(() {
                                  edad++;
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
            GestureDetector(
              onTap: () {
                CalcularResultado calc = CalcularResultado(alturas: altura, pesos: peso);
                Navigator.push(context, MaterialPageRoute(builder: (context) => PaginaResultados(
                  imcResultado: calc.calcularIMC(),
                textoResultado: calc.getResultado(),
                textoInterpretado: calc.getInterpretado(),
                )));
                
              },
              child: Container(
                child: Text('CALCULAR', style: kBotonLargoTextSyle),
                color: KColorContenedorAbajo,
                margin: EdgeInsets.only(top: 10.0),
                width: double.infinity,
                height: KAlturaContenedorAbajo,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IconoRedondo extends StatelessWidget {
  IconoRedondo({required this.iconito, required this.alPresionar});

  final IconData iconito;
  final VoidCallback alPresionar;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(iconito),
      constraints: BoxConstraints.tightFor(width: 50.0, height: 50.0),
      elevation: 6.0,
      onPressed: alPresionar,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PaginaInicio(),
  ));
}
