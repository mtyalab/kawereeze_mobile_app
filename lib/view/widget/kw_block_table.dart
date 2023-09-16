import 'package:flutter/material.dart';

import '../../theme/theme.dart';
import '../../utils/helper.dart';

class KwBlockTable extends StatelessWidget {
  const KwBlockTable({super.key,
   required this.payOffDate,
    required this.orderNo,
    required this.loanAmount,
    required this.term,
    required this.installments,
    required this.status,

  });
  final String payOffDate;
  final String orderNo;
  final String loanAmount;
  final String term;
  final String installments;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size12),
        color: Colors.blue[50]!,
      ),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(size10),
                      topRight: Radius.circular(size10)),
                  color: primaryColor),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: size15, top: size10, bottom: size10, right: size15),
                child: Row(
                  children: [
                    const Text(
                      'Pay off Date',
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.white),
                    ),
                    const Spacer(),
                    Text(
                      Helper.formatDate(payOffDate),
                      style: const TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: size15, top: size10, bottom: size10, right: size15),
            child: Row(
              children: [
                const Text(
                  'Order No.',
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.black),
                ),
                const Spacer(),
                Text(orderNo)
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: size15, right: size15),
            child: Divider(
              height: 0.5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: size15, top: size10, bottom: size10, right: size15),
            child: Row(
              children: [
                const Text(
                  'Loan amount',
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.black),
                ),
                const Spacer(),
                Text(loanAmount)
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: size15, right: size15),
            child: Divider(
              height: 0.5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: size15, top: size10, bottom: size10, right: size15),
            child: Row(
              children: [
                const Text(
                  'Term',
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.black),
                ),
                const Spacer(),
                Text(term)
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: size15, right: size15),
            child: Divider(
              height: 0.5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: size15, top: size10, bottom: size10, right: size15),
            child: Row(
              children: [
                const Text(
                  'Number of installments',
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.black),
                ),
                const Spacer(),
                Text(installments)
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: size15, right: size15),
            child: Divider(
              height: 0.5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: size15, top: size10, bottom: size10, right: size15),
            child: Row(
              children: [
                const Text(
                  'Status',
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.black),
                ),
                const Spacer(),
                Text(status)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
