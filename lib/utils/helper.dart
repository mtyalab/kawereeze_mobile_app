import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class Helper {
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static String getAssetName(String fileName) {
    return "assets/images/$fileName";
  }

  static TextTheme getTheme(BuildContext context) {
    return Theme.of(context).textTheme;
  }

  static String formatMoneyValue(num value) {
    final formatter = NumberFormat('#,##0.0');
    return formatter.format(value).replaceAll(RegExp(r'\.?0*$'), '');
  }

  static String formatDate(String dateString) {
    final dateTime = DateTime.parse(dateString);
    final formatter = DateFormat('EEEE, MMMM d, yyyy');
    return formatter.format(dateTime);
  }
}
