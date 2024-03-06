import 'package:api_rest_flutter/utils/responsive.dart';
import 'package:api_rest_flutter/widgets/input_text.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  _submit() {
    final isOK = _formKey.currentState?.validate();
  }

  @override
  Widget build(BuildContext context) {
    // PARA QUE TRABAJE DE FORMA RESPONSIVA
    final Responsive responsive = Responsive.of(context);
    return Positioned(
      bottom: 30,
      // left: 20,
      // right: 20,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: responsive.isTablet ? 430 : 440,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              InputText(
                keyboardType: TextInputType.emailAddress,
                label: "EMAIL ADDRESS",
                fontSize: responsive.dp(responsive.isTablet ? 1.2 : 1.5),
                onChanged: (text) {
                  print("email: $text");
                },
                validator: (text) {
                  // text = text.toString();
                  if (text == null || text.isEmpty) {
                    return "Invalid email";
                  }
                  return null;
                },
              ),
              SizedBox(height: responsive.dp(1.5)),
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
                        fontSize:
                            responsive.dp(responsive.isTablet ? 1.2 : 1.5),
                        onChanged: (text) {
                          print("password: $text");
                        },
                        validator: (text) {
                          text = text.toString();
                          if (!text.contains("@")) {
                            return "Invalid Password";
                          }
                          return null;
                        },
                      ),
                    ),
                    TextButton(
                      child: Text(
                        "Forgot Password",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize:
                                responsive.dp(responsive.isTablet ? 1.2 : 1.5)),
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
                    onPressed: this._submit(),
                  )
                ],
              ),
              SizedBox(
                height: responsive.dp(8),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
