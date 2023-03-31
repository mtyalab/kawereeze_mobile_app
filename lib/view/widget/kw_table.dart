import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class KwTable extends StatelessWidget {
  const KwTable(
      {Key? key,
      required this.recipientName,
      required this.transactionNumber,
      required this.amount,
      required this.transactionDate,
      required this.status,
      required this.placeholder})
      : super(key: key);

  final String recipientName;
  final String transactionNumber;
  final num amount;
  final String transactionDate;
  final String status;
  final String placeholder;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: const ShapeBorderClipper(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(size4)))),
      child: Container(
        padding: const EdgeInsets.only(top: size8, bottom: size8),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              left: BorderSide(
                color: status == 'successful' ? green : red,
                width: 2.5,
              ),
            )),
        child: ListTile(
          leading: CircleAvatar(
              backgroundImage: AssetImage(
            placeholder,
          )),
          trailing: Padding(
            padding: const EdgeInsets.only(bottom: size33),
            child: Text(
              transactionDate,
              style: const TextStyle(fontSize: size10),
            ),
          ),
          title: Text(
            recipientName,
            style: const TextStyle(
                fontSize: size15, fontWeight: FontWeight.bold),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Trans No: $transactionNumber',
                style: const TextStyle(
                    fontSize: size11, fontWeight: FontWeight.bold),
              ),
              Text(
                'Sent Amount: $amount',
                style: const TextStyle(
                    fontSize: size11, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
