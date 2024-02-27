import 'package:api_rest_flutter/widgets/circle.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            circulos(
              arriba: -100,
              izquierda: -50,
              derecha: null,
              size: 280,
              color: Colors.orange,
              colore: Colors.deepOrangeAccent,
            ),
            circulos(
              arriba: -100,
              izquierda: null,
              derecha: -50,
              size: 380,
              color: Colors.pinkAccent,
              colore: Colors.pink,
            ),
          ],
        ),
      ),
    );
  }
}

class circulos extends StatelessWidget {
  final double arriba;
  final double? izquierda;
  final double? derecha;
  final double size;
  final Color color;
  final Color colore;

  const circulos(
      {super.key,
      required this.arriba,
      required this.izquierda,
      required this.derecha,
      required this.color,
      required this.size,
      required this.colore});
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: arriba,
      left: izquierda,
      right: derecha,
      child: Circle(size: this.size, colors: [
        this.color,
        this.colore,
      ]),
    );
  }
}
