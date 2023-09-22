import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kawereeze/blocs/password_reset/password_reset_bloc.dart';
import 'package:kawereeze/theme/theme.dart';
import 'package:kawereeze/view/index.dart';
import 'package:kawereeze/view/widget/index.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../repositories/auth_repository.dart';
import '../utils/custom_alerts.dart';

class RequestPasswordResetView extends StatefulWidget {
  const RequestPasswordResetView({Key? key}) : super(key: key);

  @override
  State<RequestPasswordResetView> createState() =>
      _RequestPasswordResetViewState();
}

class _RequestPasswordResetViewState extends State<RequestPasswordResetView> {
  final form = FormGroup({
    'username': FormControl<String>(validators: [Validators.required]),
  });

  TextEditingController username = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => {Navigator.of(context).pop()},
        ),
      ),
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: BlocProvider<PasswordResetBloc>(
          create: (passwordResetContext) =>
              PasswordResetBloc(authRepository: AuthRepository()),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(
                    left: size20, right: size20, top: size8, bottom: size10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Reset Password',
                      style: kwTitle5Style,
                      textAlign: TextAlign.left,
                    ),
                    KwTitle(
                        title:
                            'Please enter your email associated with your account',
                        type: 'password-reset')
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    top: size5, left: size20, right: size20),
                child: BlocConsumer<PasswordResetBloc, PasswordResetState>(
                  listener: (passwordResetContext, state) {
                    // TODO: implement listener
                    if (state.uiStage == UIStage.REQUESTING) {
                      if (state.uiState == UIState.successful) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    VerifyPasswordIdentityView(
                                        username: state!.username,
                                        type: 'password-reset')));
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
                                subtitle: 'Sending request ...',
                                type: "table-heading",
                              )
                            ]);
                        Navigator.of(context).pop();
                      }
                    }
                  },
                  builder: (context, state) {
                    return ReactiveForm(
                      formGroup: form,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: size5),
                            child: Text(
                              'Email',
                              style: TextStyle(fontWeight: FontWeight.normal),
                            ),
                          ),
                          KwTextInput(
                            controller: username,
                            autoFocus: true,
                            formControlName: 'username',
                            obsecureText: false,
                          ),
                          const SizedBox(
                            height: size5,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if(form.value['username']
                                        .toString().isEmpty || form.value['username'] == null) {
                                      CustomAlerts().asyncSimpleAlertDialog(
                                          alignment: Alignment.center,
                                          context: context,
                                          children: [
                                            CustomAlerts().notificationDialog(
                                                context: context,
                                                imageUrl: "assets/error.png",
                                                title: "Warning",
                                                subtitle: "Field required",
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                type: "table-heading",
                                                buttonLabel: "Ok")
                                          ]);
                                    } else {
                                      BlocProvider.of<PasswordResetBloc>(context)
                                          .add(PasswordResetRequestEvent(
                                          email: form.value['username']
                                              .toString()));
                                    }

                                  },
                                  style: elevatedMinButtonStyle,
                                  child: const Text(
                                    "Submit email",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: size30,
                          )
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
