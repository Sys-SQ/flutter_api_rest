import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Circle extends StatelessWidget {
  // Tamaño deñ circulo
  final double size;
  final List<Color> colors;

  const Circle({super.key, required this.size, required this.colors})
      : assert(size != null && size > 0),
        assert(colors != null && colors.length >= 2);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.size,
      height: this.size,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
              colors: this.colors,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
    );
  }
}
