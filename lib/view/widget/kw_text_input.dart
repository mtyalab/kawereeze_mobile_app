import 'package:flutter/material.dart';
import 'package:kawereeze/theme/theme.dart';
import 'package:reactive_forms/reactive_forms.dart';

class KwTextInput extends StatelessWidget {
  const KwTextInput(
      {Key? key,
      required this.formControlName,
      required this.obsecureText,
      required this.autoFocus,
      required this.controller})
      : super(key: key);
  final String formControlName;
  final bool obsecureText;
  final bool autoFocus;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
      controller: controller,
      autofocus: autoFocus,
      formControlName: formControlName,
      obscureText: obsecureText,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.only(top: size20, left: size10),
        enabled: true,
        labelStyle: TextStyle(color: Colors.black),
        hintStyle: TextStyle(color: Color(0xFF656565)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor, width: 0.4),
        ),
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor, width: 0.4)),
        errorStyle: TextStyle(
          height: 0.7,
          color: Colors.red,
        ),
        errorText: null,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor, width: 0.4),
        ),
      ),
    );
  }
}
