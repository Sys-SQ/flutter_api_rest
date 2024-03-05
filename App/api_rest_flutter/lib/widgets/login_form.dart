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
          )
        ],
      ),
    );
  }
}
