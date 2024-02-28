import 'package:api_rest_flutter/utils/responsive.dart';
import 'package:api_rest_flutter/widgets/circle.dart';
import 'package:api_rest_flutter/widgets/icon_container.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    // Agarraremos las dimensiones del dispositivo
    final Size size = MediaQuery.of(context).size;
    final double pinkSize = responsive.wp(80);
    final double orangeSize = responsive.wp(57);
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Stack(
          // PARA CENTRAR MI ICONO
          alignment: Alignment.center,
          children: <Widget>[
            circulos(
              arriba: -(pinkSize) * 0.55,
              izquierda: -(pinkSize) * 0.15,
              derecha: null,
              size: pinkSize,
              color: Colors.orange,
              colore: Colors.deepOrangeAccent,
            ),
            circulos(
              arriba: -(orangeSize) * 0.5,
              izquierda: null,
              derecha: -(orangeSize) * 0.2,
              size: orangeSize,
              color: Colors.pinkAccent,
              colore: Colors.pink,
            ),
            // PARA EL ICONO
            Positioned(
                top: pinkSize * 0.45,
                child: Column(
                  children: [
                    IconContainer(
                      size: responsive.wp(17),
                    ),
                    // PARA LA SEPARACION DEL TEXTO
                    SizedBox(
                      height: responsive.wp(3),
                    ),
                    Text(
                      "Hello Posgrado\nWelcome Back!",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: responsive.wp(3.5)),
                    )
                  ],
                ))
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
