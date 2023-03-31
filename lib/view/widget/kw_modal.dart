import 'package:flutter/material.dart';

import '../../theme/theme.dart';


class KwModal extends StatefulWidget {
  const KwModal({ Key? key,required this.children }) : super(key: key);
  final List<Widget> children;
  @override
  State<KwModal> createState() => _KwModalState();
}

class _KwModalState extends State<KwModal> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:0),
      child: Container(
          height: MediaQuery.of(context).size.height * 0.75,
          padding: const EdgeInsets.symmetric(
            horizontal: size10,
            vertical: size10,
          ),
          decoration: const BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(size10),
              topLeft: Radius.circular(size10),
            ),
          ),
          child: Scaffold(
            backgroundColor: backgroundColor,
            body: Column(
              children: widget.children,
            ),
          )),
    );
  }
}
