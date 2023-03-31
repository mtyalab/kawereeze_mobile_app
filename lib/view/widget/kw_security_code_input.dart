import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kawereeze/theme/theme.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../welcome_view.dart';
import 'kw_title.dart';

class KwSecurityCodeInput extends StatefulWidget {
  const KwSecurityCodeInput(
      {Key? key, required this.type, required this.onCompleted, required this.resendOtp})
      : super(key: key);
  final String type;
  final ValueChanged<String> onCompleted;
  final VoidCallback resendOtp;

  @override
  State<KwSecurityCodeInput> createState() => _KwSecurityCodeInputState();
}

class _KwSecurityCodeInputState extends State<KwSecurityCodeInput> {
  TextEditingController textEditingController = TextEditingController();

  StreamController<ErrorAnimationType>? errorController;
  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: GestureDetector(
        onTap: () {},
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            children: <Widget>[
              const SizedBox(height: size10),
              Padding(
                  padding: const EdgeInsets.only(left: size30, right: size30),
                  child: KwTitle(
                      title:
                          'Please enter the 5-digit security code sent to your ${widget.type == 'signup' ? 'email address' : 'number'}',
                      type: 'otp-verification')),
              const SizedBox(
                height: size20,
              ),
              Form(
                key: formKey,
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: size5, horizontal: size50),
                    child: PinCodeTextField(
                      autoFocus: true,
                      appContext: context,
                      pastedTextStyle: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      length: 5,
                      obscureText: false,
                      blinkWhenObscuring: false,
                      animationType: AnimationType.fade,
                      inputFormatters: [
                        FilteringTextInputFormatter(RegExp("[0-9]"),
                            allow: true)
                      ],
                      pinTheme: PinTheme(
                        borderWidth: 0.4,
                        selectedColor: primaryColor,
                        selectedFillColor: backgroundColor,
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(size5),
                        fieldHeight: size70,
                        fieldWidth: size50,
                        activeColor: primaryColor,
                        inactiveColor: primaryColor,
                        inactiveFillColor: Colors.white,
                        activeFillColor: Colors.white,
                      ),
                      cursorColor: primaryColor,
                      animationDuration: const Duration(milliseconds: 300),
                      enableActiveFill: true,
                      errorAnimationController: errorController,
                      controller: textEditingController,
                      keyboardType: TextInputType.number,
                      onCompleted: widget.onCompleted,
                      onChanged: (value) {
                        setState(() {
                          currentText = value;
                        });
                      },
                      beforeTextPaste: (text) {
                        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                        //but you can show anything you want here, like your pop up saying wrong paste format or etc
                        return true;
                      },
                    )),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Didn't receive the code? ",
                    style: TextStyle(color: Colors.black54, fontSize: size15),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: const Size(size50, size30),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    onPressed: widget.resendOtp,
                    child: const Text(
                      "Resend Code",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 14,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
