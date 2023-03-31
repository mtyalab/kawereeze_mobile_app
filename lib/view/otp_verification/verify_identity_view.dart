import 'package:flutter/material.dart';
import 'package:kawereeze/utils/custom_alerts.dart';
import 'package:kawereeze/view/index.dart';
import 'package:kawereeze/view/widget/index.dart';

import '../../model/user.dart';
import '../../theme/theme.dart';

class VerifyIdentityView extends StatefulWidget {
  const VerifyIdentityView({Key? key, required this.type, required this.user})
      : super(key: key);
  final String type;
  final User? user;

  @override
  State<VerifyIdentityView> createState() => _VerifyIdentityViewState();
}

class _VerifyIdentityViewState extends State<VerifyIdentityView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => {Navigator.of(context).pop()},
        ),
      ),
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          children: [
            const Text(
              'Identity Verification',
              style: kwTitle5Style,
            ),
            Expanded(
              child: KwSecurityCodeInput(
                type: widget.type,
                onCompleted: (v) async {
                  // == Add alert
                  if (widget.type == 'signup') {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WelcomeView(
                                  user: widget.user,
                                )));
                  } else if (widget.type == 'send-money') {
                    await CustomAlerts().asyncSimpleAlertDialog(
                        alignment: Alignment.center,
                        context: context,
                        children: [
                          CustomAlerts().notificationDialog(
                              context: context,
                              imageUrl: "assets/success.png",
                              title: "Successful",
                              subtitle: "Amount successfully sent!",
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => WelcomeView(
                                              user: widget.user,
                                            )));
                              },
                              type: "table-heading",
                              buttonLabel: "Ok")
                        ]);
                  } else if (widget.type == 'reversal') {
                    await CustomAlerts().asyncSimpleAlertDialog(
                        alignment: Alignment.center,
                        context: context,
                        children: [
                          CustomAlerts().notificationDialog(
                              context: context,
                              imageUrl: "assets/success.png",
                              title: "Successful",
                              subtitle: "Transaction reversal completed!",
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => TransactionView(
                                            user: widget.user)));
                              },
                              type: "table-heading",
                              buttonLabel: "Ok")
                        ]);
                  }
                },
                resendOtp: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
