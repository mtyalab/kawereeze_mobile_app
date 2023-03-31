import 'package:flutter/material.dart';
import 'package:kawereeze/theme/theme.dart';
import 'package:reactive_forms/reactive_forms.dart';

class KwPasswordInput extends StatelessWidget {
  const KwPasswordInput(
      {Key? key,
      required this.formControlName,
      required this.obsecureText,
      required this.autoFocus,
      required this.suffixIcon,
      required this.controller})
      : super(key: key);
  final String formControlName;
  final bool obsecureText;
  final bool autoFocus;
  final Widget suffixIcon;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
      controller: controller,
      autofocus: autoFocus,
      formControlName: formControlName,
      obscureText: obsecureText,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(top: size20, left: size10),
        suffixIcon: suffixIcon,
        enabled: true,
        labelText: '',
        labelStyle: const TextStyle(color: Colors.black),
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor, width: 0.4)),
        hintText: '',
        hintStyle: const TextStyle(color: Color(0xFF656565)),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor, width: 0.4),
        ),
        fillColor: Colors.white,
        filled: true,
        errorStyle: const TextStyle(
          height: 0.7,
          color: Colors.red,
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor, width: 0.4),
        ),
      ),
    );
  }
}
