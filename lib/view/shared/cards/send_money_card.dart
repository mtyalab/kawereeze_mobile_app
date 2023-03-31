import 'package:flutter/material.dart';
import 'package:kawereeze/view/shared/custom_alerts.dart';
import 'package:kawereeze/view/widget/index.dart';
import 'package:kawereeze/view/widget/kw_dropdown.dart';

import '../../../model/user.dart';
import '../../../theme/theme.dart';
import '../../../utils/options_micro.dart';

class SedMoneyCard extends StatefulWidget {
  const SedMoneyCard({Key? key, required this.label, required this.user}) : super(key: key);
  final String label;
  final User? user;

  @override
  State<SedMoneyCard> createState() => _SedMoneyCardState();
}

class _SedMoneyCardState extends State<SedMoneyCard> {
  @override
  Widget build(BuildContext context) {
    TextEditingController recipientName = TextEditingController();
    TextEditingController recipientAddress = TextEditingController();
    TextEditingController recipientPhoneNumber = TextEditingController();
    TextEditingController bankAccount = TextEditingController();
    TextEditingController amount = TextEditingController();
    TextEditingController currency = TextEditingController();
    TextEditingController paymentMethod = TextEditingController();
    TextEditingController reason = TextEditingController();
    Object selectedPaymentMethod = "Mobile money";

    return KwCardSm(
        assetUrl: 'assets/savings.png',
        label: 'Send Money',
        onTap: () {
          showModalBottomSheet(
              isScrollControlled: true,
              isDismissible: false,
              enableDrag: false,
              backgroundColor: Colors.transparent,
              context: context,
              builder: (BuildContext modalContext) {
                return SizedBox(
                    height: MediaQuery.of(modalContext).size.height * 0.90,
                    child: savingsTable(
                      user:  widget.user,
                        context: context,
                        title: 'Savings',
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: size10, right: size10, top: size10),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(bottom: size5),
                                    child: Text(
                                      'Recipient Name',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                  KwTextInput(
                                    controller: recipientName,
                                    autoFocus: false,
                                    formControlName: 'recipientName',
                                    obsecureText: false,
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(
                                        bottom: size5, top: size10),
                                    child: Text(
                                      'Recipient Address',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                  KwTextInput(
                                    controller: recipientAddress,
                                    autoFocus: false,
                                    formControlName: 'recipientAddress',
                                    obsecureText: false,
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(
                                        bottom: size5, top: size10),
                                    child: Text(
                                      'Recipient Phone Number',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                  KwTextInput(
                                    controller: recipientPhoneNumber,
                                    autoFocus: false,
                                    formControlName: 'recipientPhoneNumber',
                                    obsecureText: false,
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(
                                        bottom: size5, top: size10),
                                    child: Text(
                                      'Currency',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                  KwDropdownWidget(
                                    formControlName: 'currency',
                                    label: 'Select currency',
                                    dropdownItems: OptionsMicro().currencies,
                                    onchange: (value) {
                                      setState(() {
                                      });
                                    },
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(
                                        bottom: size5, top: size10),
                                    child: Text(
                                      'Amount',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                  SizedBox(
                                    child: KwTextInput(
                                      controller: amount,
                                      autoFocus: false,
                                      formControlName: 'amount',
                                      obsecureText: false,
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(
                                        bottom: size5, top: size10),
                                    child: Text(
                                      'Payment Method',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                  KwDropdownWidget(
                                    formControlName: 'paymentMethod',
                                    label: 'Select method',
                                    dropdownItems: OptionsMicro().paymentOptions,
                                    onchange: (value) {
                                      setState(() {
                                      });
                                    },
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(
                                        bottom: size5, top: size10),
                                    child: Text(
                                      'Bank Account',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                  KwTextInput(
                                    controller: bankAccount,
                                    autoFocus: false,
                                    formControlName: 'bankAccount',
                                    obsecureText: false,
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(
                                        bottom: size5, top: size10),
                                    child: Text(
                                      'Reason',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                  KwTextInput(
                                    controller: reason,
                                    autoFocus: false,
                                    formControlName: 'reason',
                                    obsecureText: false,
                                  ),
                                  const SizedBox(
                                    height: size10,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(
                                        left: size10,
                                        right: size10,
                                        bottom: size5,
                                        top: size5),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(3)),
                                    child: Column(
                                      children: [
                                        Column(
                                          children: [
                                            Row(
                                              children: const [
                                                Text(
                                                  'Remittance Fee',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black),
                                                ),
                                                Spacer(),
                                                Text(
                                                  '${500}',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.normal),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.all(size4),
                                          child: Divider(
                                            height: 0.5,
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Row(
                                              children: const [
                                                Text(
                                                  'Total',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black),
                                                ),
                                                Spacer(),
                                                Text(
                                                  '${200500}',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.normal),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: size10,
                                  ),
                                ]),
                          ),
                        ],
                        prevLabel: 'Cancel',
                        nextLabel: 'Send'));
              });
        });
  }
}
