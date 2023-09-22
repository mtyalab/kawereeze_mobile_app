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

  static String maskEmail(String? email) {
    if (email!.isEmpty) {
      return email; // Return empty string if the email is empty
    }

    // Split the email address into two parts: the username and the domain
    List<String> parts = email.split("@");

    if (parts.length != 2) {
      return email; // Return the original email if it doesn't contain exactly one "@" symbol
    }

    String username = parts[0];
    String domain = parts[1];

    // Mask the middle characters of the username with asterisks
    String maskedUsername = username.substring(0, 2) + '*' * (username.length - 4) + username.substring(username.length - 2);

    // Combine the masked username and the domain to form the masked email
    String maskedEmail = maskedUsername + "@" + domain;

    return maskedEmail;
  }
}
