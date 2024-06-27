import 'package:flutter/material.dart';

class TarjetaReusable extends StatelessWidget {

  TarjetaReusable({required this.colorido, required this.tarjetaChild, required this.alPresionar});
  final Color colorido;
  final Widget tarjetaChild;
  final VoidCallback alPresionar;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: alPresionar,
      child: Container(
        child: tarjetaChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: colorido,
        ),
      ),
    );
  }
}