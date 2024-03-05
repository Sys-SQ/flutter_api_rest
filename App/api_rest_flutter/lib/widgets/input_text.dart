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
      style: TextStyle(),
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
