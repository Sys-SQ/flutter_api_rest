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
