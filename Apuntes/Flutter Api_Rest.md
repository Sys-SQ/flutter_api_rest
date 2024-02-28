
Creación del proyecto 
![[Code_RIV0jEW44K.gif]]
Creación de carpeta *pages*
![[Code_uckYJ8TLAw.gif]]
![[chrome_JtKeUOhcii.gif]]

Creación de la carpeta de *widgets*
![[Code_2BFzcvrH3n.gif]]
Algunos atajos
![[Code_6YySEYdlSK.gif]]

Circulos Acabado de forma responsiva
![[chrome_SrZYn1uKyr.gif]]

### Clase *main.dart*
```
import 'package:api_rest_flutter/pages/home_page.dart';
import 'package:flutter/material.dart';
void main() => runApp(MyApp());  
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}
```

### Clase *home_page.dart*

```
import 'package:api_rest_flutter/widgets/circle.dart';
import 'package:flutter/material.dart';
  
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // Agarraremos las dimensiones del dispositivo
    final Size size = MediaQuery.of(context).size;
    final double pinkSize = size.width * 0.57;
    final double orangeSize = size.width * 0.8;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Stack(
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
```

### Clase *circle.dart*

```
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
```

-- -

## Interfaz Icono responsivo
![[Pasted image 20240228145618.png]]
![[chrome_zPlelWtDec.gif]]

![[chrome_KMXG9XwHNV.gif]]

Carpeta *asstes*
![[Code_OJUe6QHUUo.gif]]

![[Pasted image 20240228154717.png]]

![[Pasted image 20240228155030.png]]

![[Pasted image 20240228161108.png]]
![[Code_ze2ISy6k8w.gif]]

### Clase *icon_container*

```
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
```

### Clase *home_page.dart*

```
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
    // Agarraremos las dimensiones del dispositivo
    final Size size = MediaQuery.of(context).size;
    final double pinkSize = size.width * 0.57;
    final double orangeSize = size.width * 0.8;
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
                child: IconContainer(
                  size: size.width * 0.17,
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
```

![[Pasted image 20240228164140.png]]

![[Pasted image 20240228164110.png]]
-- -
## Para bloquear la rotación de la pantalla

![[Pasted image 20240228164926.png]]

-- -
## Texto de la app
![[Pasted image 20240228165122.png]]
![[Code_EkkZrHhHxf.gif]]


Creación de archivo responsivo
![[Pasted image 20240228165709.png]]

![[Code_dskjyKgDYc.gif]]

### Clase  *responsive.dart*
```
import 'package:flutter/material.dart';

import 'dart:math' as math;

  

class Responsive {

  double _width = 0, _height = 0, _diagonal = 0;

  

  double get width => _width;
  double get height => _height;
  double get diagonal => _diagonal;
  static Responsive of(BuildContext context) => Responsive(context);
  Responsive(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    this._width = size.width;
    this._height = size.height;

    //c2+a2+b2 => srt(a2+b2)
    this._diagonal = math.sqrt(math.pow(_width, 2) + math.pow(_height, 2));
  }

  double wp(double percent) => _width * percent / 100;
  double hp(double percent) => _height * percent / 100;
  double dp(double percent) => _diagonal * percent / 100;
}
```

### Clase *home_page.dart*

```
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
```

![[Pasted image 20240228183307.png]]
