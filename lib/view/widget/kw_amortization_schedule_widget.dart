import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../theme/theme.dart';

class KwAmortizationScheduleWidget extends StatelessWidget {
  const KwAmortizationScheduleWidget({
    Key? key,
    required this.loanAmount,
    required this.loanTermMonths,
    required this.interestRate,
  }) : super(key: key);

  final double loanAmount;
  final int loanTermMonths;
  final double interestRate;

  @override
  Widget build(BuildContext context) {
    final monthlyInterestRate = interestRate / 12 / 100;
    double remainingBalance = loanAmount;

    List<Map<String, dynamic>> amortizationSchedule = [];

    final currencyFormatter = NumberFormat.currency(
      locale: 'en_UG',
      symbol: 'UGX',
    );

    for (int month = 1; month <= loanTermMonths; month++) {
      final interestPayment = remainingBalance * monthlyInterestRate;
      // final principalPayment = loanAmount / loanTermMonths - interestPayment;
      final principalPayment = (loanAmount * monthlyInterestRate) /
          (1 - (1 / (pow(1 + monthlyInterestRate, loanTermMonths))));
      remainingBalance -= principalPayment;

      final amortizationEntry = {
        'Month': month,
        'Payment': loanAmount / loanTermMonths,
        'Principal Payment': principalPayment,
        'Interest Payment': interestPayment,
        'Remaining Balance': remainingBalance,
      };

      amortizationSchedule.add(amortizationEntry);
    }

    return Padding(
      padding: const EdgeInsets.only(left: size20, right: size20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(size12),
              color: Colors.blue[50]!,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: size15, top: size10, bottom: size10, right: size15),
                  child: Row(
                    children: [

                      const Text(
                        'Loan Amount',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.black),
                      ),
                      const Spacer(),
                      Text(currencyFormatter.format(loanAmount).toString())
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
                        'Loan Term',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.black),
                      ),
                      const Spacer(),
                      Text('$loanTermMonths months')
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
                        'Interest Rate',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.black),
                      ),
                      const Spacer(),
                      Text('${interestRate.toStringAsFixed(2)}%')
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: size15, right: size15),
                  child: Divider(
                    height: 0.5,
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(
                //       left: size15, top: size10, bottom: size10, right: size15),
                //   child: Row(
                //     children: [
                //       const Text(
                //         'Monthly Payment',
                //         style: TextStyle(
                //             fontWeight: FontWeight.w500, color: Colors.black),
                //       ),
                //       const Spacer(),
                //       Text('${currencyFormatter.format(loanAmount / loanTermMonths)}')
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
          SizedBox(height: size20),
          for(int i = 0; i < amortizationSchedule.length; i++)
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(size12),
                    color: Colors.blue[50]!,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: size15, top: size10, bottom: size10, right: size15),
                        child: Row(
                          children: [

                            const Text(
                              'Month',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, color: Colors.black),
                            ),
                            const Spacer(),
                            Text(amortizationSchedule[i]['Month'].toString())
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
                              'Payment',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, color: Colors.black),
                            ),
                            const Spacer(),
                            Text(currencyFormatter.format(amortizationSchedule[i]['Payment']))
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
                              'Principal Payment',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, color: Colors.black),
                            ),
                            const Spacer(),
                            Text(currencyFormatter.format(amortizationSchedule[i]['Principal Payment']))
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
                              'Interest Payment',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, color: Colors.black),
                            ),
                            const Spacer(),
                            Text(currencyFormatter.format(amortizationSchedule[i]['Interest Payment']))
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
                              'Remaining Balance',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, color: Colors.black),
                            ),
                            const Spacer(),
                            Text(currencyFormatter.format(amortizationSchedule[i]['Remaining Balance']))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size20),
              ],
            ),
        ],
      ),
    );
  }
}
