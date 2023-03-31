import 'package:flutter/material.dart';

import '../../theme/theme.dart';


class KwFloatingButton extends StatelessWidget {
  const KwFloatingButton({Key? key, required this.onPressed, required this.icon}) : super(key: key);
  final VoidCallback onPressed;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const CircleBorder(),
      onPressed: onPressed,
      backgroundColor: primaryColor,
     child: icon,
    );
  }
}
