import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class KwSingleLineTextStrip extends StatelessWidget {
  const KwSingleLineTextStrip(
      {Key? key,
      required this.title,
      required this.widget
      })
      : super(key: key);

  final String title;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: const ShapeBorderClipper(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(size4)))),
      child: Container(
        padding: const EdgeInsets.only(top: 0, bottom: 0),
        decoration: const BoxDecoration(
            color: Colors.white,
        ),
        child: ListTile(
       trailing: widget,
          title: Text(
            title,
            style: const TextStyle(
                fontSize: size15, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
