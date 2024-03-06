
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

-- -
 ## Formulario del login

 ![[Pasted image 20240301152133.png]]
![[Code_xxpyrIn4CY.gif]]

![[Pasted image 20240301153203.png]]

![[chrome_TgHpd5o6jg.gif]]

![[Code_nBIdgsMdC7.gif]]

Minimiza el teclado cuando la se presiona la pantalla
![[qemu-system-x86_64_L8zuhVrjdr.gif]]

Creacion de una nueva clase para los formularios
![[Pasted image 20240301161103.png]]

LLAMADA  A LA CLASE
![[Pasted image 20240301161426.png]]

![[chrome_wPMeYkGErW.gif]]

PARA COLOCAR EL TECLADO DE TIPO EMAIL
![[Pasted image 20240301162532.png]]
![[chrome_fdi1D8m5UD.gif]]

OCULTAR EL CAMPO DE PASSWORD
![[Pasted image 20240301163547.png]]

![[chrome_ZRn4jH6Xh6.gif]]

TEXTFIELD QUE SE ACOMODE SIN AFECTAR EL DISÑO DE FONDO
![[Code_0q66D5mmmq.gif]]

Colocamos el tamaño responsivo
![[Pasted image 20240301171632.png]]

Agrega un texto al costado del *textfield* de la contraseña 
![[Pasted image 20240301173506.png]]

Borde inferior
![[msedge_5a5jD9g6Zj.gif]]
 
 Para el espacio entre el borde 
 ![[Pasted image 20240305144240.png]]
Para que sean los mismos colores del border
![[Pasted image 20240305144613.png]]

### Clase *input_text.dart*
```
import 'package:flutter/material.dart';
class InputText extends StatelessWidget {
  final String label;
  final bool obscureText, borderEnabled;
  final TextInputType keyboardType;

  const InputText(
      {super.key,
      this.label = '',
      this.keyboardType = TextInputType.text,
      this.obscureText = false,
      this.borderEnabled = true});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: this.keyboardType,
      obscureText: this.obscureText,
      decoration: InputDecoration(
          labelText: this.label,
          contentPadding: EdgeInsets.symmetric(vertical: 5),
          enabledBorder: this.borderEnabled
              ? UnderlineInputBorder(
                  borderSide: BorderSide(
                  color: Colors.black45,
                ))
              : InputBorder.none,
          labelStyle: TextStyle(
            color: Colors.black45,
            fontWeight: FontWeight.w500,
          )),
    );
  }
}
```

### Clase *login_form.dart*
```
import 'package:api_rest_flutter/widgets/input_text.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  @override
  State<LoginForm> createState() => _LoginFormState();
}


class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 30,
      left: 20,
      right: 20,
      child: Column(
        children: <Widget>[
          InputText(
              keyboardType: TextInputType.emailAddress, label: "EMAIL ADDRESS"),
          Container(
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                color: Colors.black87,
              )),
            ),

            child: Row(
              children: <Widget>[
                Expanded(
                  child: InputText(
                    label: "PASSWORD",
                    obscureText: true,
                    borderEnabled: false,
                  ),
                ),
                TextButton(
                  child: Text(
                    "Forgot Password",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
```

### Clase Home_page.dart
```
import 'package:api_rest_flutter/utils/responsive.dart';
import 'package:api_rest_flutter/widgets/circle.dart';
import 'package:api_rest_flutter/widgets/icon_container.dart';
import 'package:api_rest_flutter/widgets/login_form.dart';
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
      body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },

          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              height: responsive.height,
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
                      )),
                  LoginForm()
                ],
              ),
            ),
          )),
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
-- -
## Sección del buttom y del texto
![[Pasted image 20240305145331.png]]
Para el button
![[Pasted image 20240305153601.png]]

Para el texto 
![[Pasted image 20240305154530.png]]

Ahora para que trabaje de forma responsiva.
![[Pasted image 20240305154824.png]]

Tamaño de la diagonal

![[Pasted image 20240305155056.png]]

Para el tamaño responsivo del texto
![[Pasted image 20240305155246.png]]

![[Pasted image 20240305155634.png]]

![[Code_6R9vxNzau9.gif]]
 
 Espacio del margin buttom
 ![[Pasted image 20240306090925.png]]
 Espacio del los textFields
 ![[Pasted image 20240306091138.png]]
 ## Login_form.dart
 
```
import 'package:api_rest_flutter/utils/responsive.dart';
import 'package:api_rest_flutter/widgets/input_text.dart';
import 'package:flutter/material.dart'; 
class LoginForm extends StatefulWidget {
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    // PARA QUE TRABAJE DE FORMA RESPONSIVA
    final Responsive responsive = Responsive.of(context);
    return Positioned(
      bottom: 30,
      left: 20,
      right: 20,
      child: Column(
        children: <Widget>[
          InputText(
            keyboardType: TextInputType.emailAddress,
            label: "EMAIL ADDRESS",
            fontSize: responsive.dp(1.5),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                color: Colors.black87,
              )),
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: InputText(
                    label: "PASSWORD",
                    obscureText: true,
                    borderEnabled: false,
                    fontSize: responsive.dp(1.4),
                  ),
                ),

                TextButton(
                  child: Text(
                    "Forgot Password",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: responsive.dp(1.5)),
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ),

          SizedBox(height: responsive.dp(5)),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.pinkAccent,
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
              child: Text(
                "Sign in",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {},
            ),
          ),
          // PÀRA EL TEXTO
          SizedBox(height: responsive.dp(4)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "New to Friendly Desi?",
                style: TextStyle(fontSize: responsive.dp(1.5)),
              ),

              TextButton(
                child: Text(
                  "Sign up",
                  style: TextStyle(
                    color: Colors.pinkAccent,
                    fontSize: responsive.dp(1.5),
                  ),
                ),
                onPressed: () {},
              )
            ],
          ),
          SizedBox(
            height: responsive.dp(8),
          ),
        ],
      ),
    );
  }
}
```

##  Input_text.dart

```
import 'package:flutter/material.dart';


class InputText extends StatelessWidget {
  final String label;
  final bool obscureText, borderEnabled;
  final double fontSize;
  final TextInputType keyboardType;

  const InputText({
    super.key,
    this.label = '',
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.borderEnabled = true,
    this.fontSize = 15,
  });

  
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: this.keyboardType,
      obscureText: this.obscureText,
      style: TextStyle(
        fontSize: this.fontSize,
      ),

      decoration: InputDecoration(
          labelText: this.label,
          contentPadding: EdgeInsets.symmetric(vertical: 5),
          enabledBorder: this.borderEnabled
              ? UnderlineInputBorder(
                  borderSide: BorderSide(
                  color: Colors.black45,
                ))
              : InputBorder.none,
          labelStyle: TextStyle(
            color: Colors.black45,
            fontWeight: FontWeight.w500,
          )),
    );
  }
}
```
-- -
## Forma responsiva 
![[Code_oMj9QCpuPK.gif]]

En la clase responsiva verificaremos si es una Tablet o un dispositivo móvil.

![[Pasted image 20240306114227.png]]

![[Pasted image 20240306114335.png]]

![[Pasted image 20240306114555.png]]

![[Pasted image 20240306115105.png]]
# Fin del Diseño
-- -
## Recibir el texto
![[Pasted image 20240306120453.png]]

![[Pasted image 20240306120923.png]]

## Validar los campos
![[Pasted image 20240306121642.png]]

![[Code_sJAGkXXuLR.gif]]

# video 12