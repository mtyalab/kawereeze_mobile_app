import 'package:flutter/material.dart';

import '../theme/theme.dart';
import '../view/widget/kw_title.dart';

class CustomAlerts {
  Future<dynamic> asyncSimpleDialog(
      {required BuildContext context,
      required List<Widget> children,
      required AlignmentGeometry alignment}) async {
    return showGeneralDialog<dynamic>(
      context: context,
      barrierDismissible: false, // user must tap button!
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (BuildContext context, Animation animation, Animation secondaryAnimation) {
        return SafeArea(
          child: Container(
            decoration: const BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(size7),
                )),
            margin: const EdgeInsets.all(size15),
            child: Scaffold(
              backgroundColor: backgroundColor,
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(size10),
                  child: Column(
                    children: children,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }


  Future<dynamic> asyncSimpleAlertDialog(
      {required BuildContext context,
        required List<Widget> children,
        required AlignmentGeometry alignment}) async {
    return showGeneralDialog<dynamic>(
      context: context,
      barrierDismissible: false, // user must tap button!
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (BuildContext context, Animation animation, Animation secondaryAnimation) {
        return SimpleDialog(
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(size8))),
          children: children,
        );
      },
    );
  }

  Column notificationDialog(
      {required BuildContext context,
      required String imageUrl,
      required String title,
      required String? subtitle,
      required VoidCallback onPressed,
      required String type,
      required String buttonLabel
      }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          imageUrl,
          width: size50,
        ),
        const SizedBox(
          height: size10,
        ),
        KwTitle(
          type: type,
          title: title,
        ),
        Text("$subtitle", textAlign: TextAlign.center,),
        const SizedBox(
          height: size20,
        ),
        Padding(
          padding: const EdgeInsets.only(left:size15, right: size15,),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onPressed,
              style: elevatedMinButtonStyle,
              child:  Text(
                buttonLabel,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }


  Column alertDialog(
      {required BuildContext context,
        required Widget loader,
        required String title,
        required String subtitle,
        required String type,
      }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 20,
          height: 20,
          child: loader,
        ),
        const SizedBox(
          height: size10,
        ),
        KwTitle(
          type: type,
          title: title,
        ),
        Text(subtitle),
      ],
    );
  }
}
