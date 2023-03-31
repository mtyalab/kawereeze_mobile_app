import 'package:flutter/material.dart';

class KwIconButton extends StatelessWidget {
  const KwIconButton({Key? key, required this.icon, required this.onPressed})
      : super(key: key);
  final Widget icon;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onPressed, icon: icon);
  }
}
