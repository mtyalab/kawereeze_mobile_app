import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class KwCardLg extends StatelessWidget {
  const KwCardLg(
      {Key? key,
      required this.content})
      : super(key: key);
     final List<Widget> content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: size20, right: size20, top: size15, bottom: size10),
      child: SizedBox(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                  left: size12, right: size12, top: size15, bottom: size10),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(size7),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: content,
              ),
            ),


          ],
        ),
      ),
    );
  }
}
