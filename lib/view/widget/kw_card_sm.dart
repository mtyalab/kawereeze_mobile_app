import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class KwCardSm extends StatelessWidget {
  const KwCardSm(
      {Key? key,
      required this.assetUrl,
      required this.label,
      required this.onTap})
      : super(key: key);
  final String assetUrl;
  final String label;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width /2.4,
              padding: const EdgeInsets.only(
                  left: size12, right: size12, top: size15, bottom: size10),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(size7),
                  )),
              child: Column(
                children: [
                  Image.asset(
                    width: size40,
                    assetUrl,
                  ),
                  const SizedBox(
                    height: size10,
                  ),
                  Text(
                    label,
                    style: const TextStyle(color: Colors.black, fontSize: 13),
                  )
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}
