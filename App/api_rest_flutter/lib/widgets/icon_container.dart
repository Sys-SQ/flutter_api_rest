import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconContainer extends StatelessWidget {
  // PARA QUE SEA RESPONSIVO
  final double size;
  const IconContainer({super.key, required this.size})
      : assert(size > 0 && size != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.size,
      height: this.size,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(this.size * 0.15),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 15,
            offset: Offset(0, 15),
          )
        ],
      ),
      padding: EdgeInsets.all(this.size * 0.15),
      child: Center(
        child: SvgPicture.asset(
          'assets/icon.svg',
          width: this.size * 0.7,
          height: this.size * 0.7,
        ),
      ),
    );
  }
}
