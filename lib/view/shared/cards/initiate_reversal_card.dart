import 'package:flutter/material.dart';
import 'package:kawereeze/view/index.dart';

import '../../../model/user.dart';
import '../../widget/kw_card_sm.dart';

class InitiateReversalCard extends StatelessWidget {
  const InitiateReversalCard(
      {Key? key, required this.label, required this.user})
      : super(key: key);
  final String label;
  final User? user;
  @override
  Widget build(BuildContext context) {
    return KwCardSm(
      assetUrl: 'assets/arrow.png',
      label: label,
      onTap: () async {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TransactionView(
                      user: user,
                    )));
      },
    );
  }
}
