import 'package:flutter/material.dart';
import 'package:kawereeze/theme/theme.dart';

class KwTitle extends StatelessWidget {
  const KwTitle({Key? key, required this.title, required this.type})
      : super(key: key);
  final String? title;
  final String type;
  @override
  Widget build(BuildContext context) {
    return type == 'date'
        ? Text(
            '${title!.toUpperCase()}',
            style: kwTitle3Style,
            textAlign: TextAlign.left,
          )
        : (type == 'password-reset')
            ? Text(
                '$title',
                style: kwTitleStyle,
                textAlign: TextAlign.left,
              )
            :
    (type == 'otp-verification')
        ? Text(
      '$title',
      style: kwTitleStyle,
      textAlign: TextAlign.center,
    ):
    Text(
                '$title',
                style: type == 'welcome' ? kwTitle2Style : kwTitleStyle,
                textAlign: TextAlign.left,
              );
  }
}
