import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../model/user.dart';
import '../../theme/theme.dart';
import '../otp_verification/verify_identity_view.dart';
import '../widget/kw_modal.dart';

/// Set targets table
Widget savingsTable(
    {required BuildContext context,
    required String title,
    required List<Widget> children,
     required User? user,
    required String prevLabel,
    required String nextLabel}) {
  final form = FormGroup({
    'recipientName': FormControl<String>(validators: [Validators.required]),
    'recipientAddress': FormControl<String>(validators: [Validators.required]),
    'recipientPhoneNumber':
        FormControl<String>(validators: [Validators.required]),
    'bankAccount': FormControl<String>(validators: [Validators.required]),
    'amount': FormControl<String>(validators: [Validators.required]),
    'currency': FormControl<String>(validators: [Validators.required]),
    'paymentMethod': FormControl<String>(validators: [Validators.required]),
    'reason': FormControl<String>(validators: [Validators.required]),
    'remittanceFee': FormControl<String>(validators: [Validators.required]),
  });

  return KwModal(
    children: [
      ReactiveForm(
          formGroup: form,
          child: Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: size10),
                      child: Text(
                        title,
                        style: const TextStyle(
                          height: 1.2,
                          fontSize: size20,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: size10),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset(
                          "assets/close.png",
                          width: size20,
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(
                  color: Colors.grey,
                ),
                Expanded(
                    child: ListView(
                      shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  children: children,
                )),
                Container(
                  padding: const EdgeInsets.only(
                      left: size5, right: size5, top: size20),
                  child: Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: elevatedMinOutlineButtonStyle,
                          child: Text(
                            prevLabel,
                            style: const TextStyle(color: primaryColor),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: size5,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            print('${form.value}');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                    VerifyIdentityView(
                                      user: user,
                                      type: 'send-money',
                                    )));
                          },
                          style: elevatedMinButtonStyle,
                          child: Text(
                            nextLabel,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    ],
  );
}
