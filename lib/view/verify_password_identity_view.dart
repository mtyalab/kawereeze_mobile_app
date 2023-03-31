import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kawereeze/blocs/password_reset/password_reset_bloc.dart';
import 'package:kawereeze/repositories/auth_repository.dart';
import 'package:kawereeze/view/index.dart';
import 'package:kawereeze/view/recover_account_view.dart';
import 'package:kawereeze/view/widget/index.dart';

import '../theme/theme.dart';
import '../utils/custom_alerts.dart';

class VerifyPasswordIdentityView extends StatefulWidget {
  const VerifyPasswordIdentityView(
      {Key? key, required this.username, required this.type})
      : super(key: key);
  final String type;
  final String? username;

  @override
  State<VerifyPasswordIdentityView> createState() =>
      _VerifyPasswordIdentityViewState();
}

class _VerifyPasswordIdentityViewState
    extends State<VerifyPasswordIdentityView> {
  @override
  Widget build(BuildContext context) {
    final passwordResetBloc =
        PasswordResetBloc(authRepository: AuthRepository());
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
              child: BlocProvider<PasswordResetBloc>(
                create: (resetContext) => passwordResetBloc,
                child: BlocListener<PasswordResetBloc, PasswordResetState>(
                  listener: (resetContext, state) {
                    // TODO: implement listener
                    if (state.uiStage == UIStage.VERIFICATION) {
                      if (state.uiState == UIState.successful) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BlocProvider.value(
                                      value: passwordResetBloc,
                                      child: RecoverAccountView(
                                        username: widget.username,
                                      ),
                                    )));
                      } else if (state.uiState == UIState.failing) {
                        CustomAlerts().asyncSimpleAlertDialog(
                            alignment: Alignment.center,
                            context: context,
                            children: [
                              CustomAlerts().notificationDialog(
                                  context: context,
                                  imageUrl: "assets/error.png",
                                  title: "Warning",
                                  subtitle: state.message,
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  type: "table-heading",
                                  buttonLabel: "Ok")
                            ]);
                      } else if (state.uiState == UIState.loading) {
                        CustomAlerts().asyncSimpleAlertDialog(
                            alignment: Alignment.center,
                            context: context,
                            children: [
                              CustomAlerts().alertDialog(
                                context: context,
                                loader: const CircularProgressIndicator(
                                  strokeWidth: 1,
                                ),
                                title: "Wait",
                                subtitle: 'Verifying request ...',
                                type: "table-heading",
                              )
                            ]);
                        Navigator.of(context).pop();
                      }
                    } else if (state.uiStage == UIStage.REQUESTING) {
                      if (state.uiState == UIState.failing) {
                        CustomAlerts().asyncSimpleAlertDialog(
                            alignment: Alignment.center,
                            context: context,
                            children: [
                              CustomAlerts().notificationDialog(
                                  context: context,
                                  imageUrl: "assets/error.png",
                                  title: "Warning",
                                  subtitle: state.message,
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  type: "table-heading",
                                  buttonLabel: "Ok")
                            ]);
                      } else if (state.uiState == UIState.loading) {
                        CustomAlerts().asyncSimpleAlertDialog(
                            alignment: Alignment.center,
                            context: context,
                            children: [
                              CustomAlerts().alertDialog(
                                context: context,
                                loader: const CircularProgressIndicator(
                                  strokeWidth: 1,
                                ),
                                title: "Wait",
                                subtitle: 'Verifying request ...',
                                type: "table-heading",
                              )
                            ]);
                        Navigator.of(context).pop();
                      }
                    }
                  },
                  child: KwSecurityCodeInput(
                    resendOtp: () {
                      passwordResetBloc.add(ResendPasswordResetRequestEvent(
                          email: widget.username));
                    },
                    type: widget.type,
                    onCompleted: (v) async {
                      // == Add alert
                      passwordResetBloc.add(VerifyPasswordResetRequestEvent(
                          otp: v.toString(),
                          accountIdentifier: widget.username));
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
