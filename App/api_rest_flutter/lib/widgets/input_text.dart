import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final String label;
  final bool obscureText, borderEnabled;
  final double fontSize;
  final TextInputType keyboardType;
  final void Function(String text) onChanged;
  final String? Function(String? text) validator;
  const InputText({
    super.key,
    this.label = '',
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.borderEnabled = true,
    this.fontSize = 15,
    required this.onChanged,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: this.keyboardType,
      obscureText: this.obscureText,
      // PARA RECIBIR EL TEXTO
      onChanged: this.onChanged,
      // PARA LA VALIDACION
      validator: this.validator,
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
