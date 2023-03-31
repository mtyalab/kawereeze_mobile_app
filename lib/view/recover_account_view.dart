import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kawereeze/blocs/password_reset/password_reset_bloc.dart';
import 'package:kawereeze/repositories/auth_repository.dart';
import 'package:kawereeze/view/index.dart';
import 'package:kawereeze/view/widget/index.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../theme/theme.dart';
import '../utils/custom_alerts.dart';

class RecoverAccountView extends StatefulWidget {
  const RecoverAccountView({Key? key, required this.username})
      : super(key: key);
  final String? username;

  @override
  State<RecoverAccountView> createState() => _RecoverAccountViewState();
}

class _RecoverAccountViewState extends State<RecoverAccountView> {
  final form = FormGroup({
    'password': FormControl<String>(validators: [Validators.required]),
    'confirmPassword': FormControl<String>(validators: [Validators.required]),
  });

  bool _passwordVisible = true;
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  void _showPassword() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  var passwordResetBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    passwordResetBloc = BlocProvider.of<PasswordResetBloc>(context);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    if (passwordResetBloc != null) {
      passwordResetBloc.close;
    }
  }

  @override
  Widget build(BuildContext context) {
    // final passwordResetBloc = context.read<PasswordResetBloc>();
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: BlocProvider<PasswordResetBloc>(
          create: (newPasswordCreationContext) => passwordResetBloc,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                        top: size50, left: size20, right: size20),
                    child: BlocConsumer<PasswordResetBloc, PasswordResetState>(
                      listener: (newPasswordCreationContext, state) {
                        // TODO: implement listener
                        if (state.uiStage == UIStage.CREATION) {
                          if (state.uiState == UIState.successful) {
                            CustomAlerts().asyncSimpleAlertDialog(
                                alignment: Alignment.center,
                                context: context,
                                children: [
                                  CustomAlerts().notificationDialog(
                                      context: context,
                                      imageUrl: "assets/success.png",
                                      title: "Successful",
                                      subtitle: "Password successfully set!",
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const LoginView()));
                                      },
                                      type: "table-heading",
                                      buttonLabel: "Log In")
                                ]);
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
                                    subtitle: 'Creating new password ...',
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
                              const Text(
                                'Set new password',
                                style: kwTitle5Style,
                              ),
                              Row(
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        bottom: size5, top: size10),
                                    child: Text(
                                      'Password',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                  Spacer(),
                                ],
                              ),
                              KwPasswordInput(
                                controller: password,
                                autoFocus: false,
                                formControlName: 'password',
                                obsecureText: _passwordVisible,
                                suffixIcon: InkWell(
                                  onTap: () {
                                    _showPassword();
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: size30, right: size10),
                                    child: Icon(
                                      _passwordVisible
                                          ? Icons.remove_red_eye
                                          : Icons.visibility_off,
                                      size: size18,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        bottom: size5, top: size10),
                                    child: Text(
                                      'Confirm Password',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                  Spacer(),
                                ],
                              ),
                              KwPasswordInput(
                                controller: confirmPassword,
                                autoFocus: false,
                                formControlName: 'confirmPassword',
                                obsecureText: _passwordVisible,
                                suffixIcon: InkWell(
                                  onTap: () {
                                    _showPassword();
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: size30, right: size10),
                                    child: Icon(
                                      _passwordVisible
                                          ? Icons.remove_red_eye
                                          : Icons.visibility_off,
                                      size: size18,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: size10,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: OutlinedButton(
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const LoginView()),
                                        );
                                      },
                                      style: elevatedMinOutlineButtonStyle,
                                      child: const Text(
                                        "Log In",
                                        style: TextStyle(color: primaryColor),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: size5,
                                  ),
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        if (form.invalid ||
                                            form.value['password'] == null ||
                                            form.value['confirmPassword'] ==
                                                null ||
                                            form.value['password']
                                                .toString()
                                                .isEmpty ||
                                            form.value['confirmPassword']
                                                .toString()
                                                .isEmpty) {
                                          CustomAlerts().asyncSimpleAlertDialog(
                                              alignment: Alignment.center,
                                              context: context,
                                              children: [
                                                CustomAlerts()
                                                    .notificationDialog(
                                                        context: context,
                                                        imageUrl:
                                                            "assets/error.png",
                                                        title: "Warning",
                                                        subtitle:
                                                            'All fields are required!',
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        type: "table-heading",
                                                        buttonLabel: "Ok")
                                              ]);
                                        } else {
                                          BlocProvider.of<PasswordResetBloc>(
                                                  context)
                                              .add(NewPasswordEvent(
                                                  password: form
                                                      .value['password']
                                                      .toString(),
                                                  username: widget.username));
                                        }
                                      },
                                      style: elevatedMinButtonStyle,
                                      child: const Text(
                                        "Save",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
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
        ),
      ),
    );
  }
}
