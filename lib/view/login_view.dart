import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kawereeze/blocs/login/login_bloc.dart';
import 'package:kawereeze/repositories/auth_repository.dart';
import 'package:kawereeze/theme/theme.dart';
import 'package:kawereeze/view/index.dart';
import 'package:kawereeze/view/widget/index.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../utils/custom_alerts.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final form = FormGroup({
    'username': FormControl<String>(
        validators: [Validators.required, Validators.email]),
    'password': FormControl<String>(validators: [Validators.required]),
  });

  bool _passwordVisible = true;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isUsernameInputFilled = false;
  bool isPasswordInputFilled = false;

  void _showPassword() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  @override
  void initState() {
    super.initState();

    username.addListener(() {
      setState(() {
        if (username.text.isNotEmpty && username.text.length >= 8) {
          isUsernameInputFilled = true;
        }
      });
    });

    password.addListener(() {
      setState(() {
        if (password.text.length >= 8) {
          isPasswordInputFilled = true;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(
                    left: size100, right: size100, top: size40, bottom: 30),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/background_image.png'),
                        fit: BoxFit.cover)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/kw_logo_no_bg.png', width: 500),
                  ],
                ),
              ),
              BlocProvider<LoginBloc>(
                create: (loginContext) => LoginBloc(AuthRepository()),
                child: Container(
                  margin: const EdgeInsets.only(
                      top: size10, left: size20, right: size20),
                  child: BlocConsumer<LoginBloc, LoginState>(
                    listener: (loginContext, state) {
                      // TODO: implement listener
                      if (state.loginUIState == LoginUIState.Success) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WelcomeView(
                                      user: state.user,
                                    )));
                      }

                      if (state.loginUIState == LoginUIState.Failed) {
                        CustomAlerts().asyncSimpleAlertDialog(
                            alignment: Alignment.center,
                            context: loginContext,
                            children: [
                              CustomAlerts().notificationDialog(
                                  context: loginContext,
                                  imageUrl: "assets/error.png",
                                  title: "Warning",
                                  subtitle: "${state.message}.",
                                  onPressed: () {
                                    Navigator.of(loginContext).pop();
                                  },
                                  type: "table-heading",
                                  buttonLabel: "Ok")
                            ]);
                      }

                      if (state.loginUIState == LoginUIState.Loading) {
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
                                subtitle: 'Logging in ...',
                                type: "table-heading",
                              )
                            ]);
                        Navigator.of(context).pop();
                      }
                    },
                    builder: (loginContext, state) {
                      return ReactiveForm(
                        formGroup: form,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding:
                                  EdgeInsets.only(bottom: size5, top: size10),
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
                            Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(
                                      bottom: size5, top: size10),
                                  child: Text(
                                    'Password',
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                                const Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: size5, top: size10),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const RequestPasswordResetView()));
                                    },
                                    child: const Text(
                                      'Forgot Password?',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: primaryColor),
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                ),
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
                            const SizedBox(
                              height: size10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: isUsernameInputFilled &&
                                            isPasswordInputFilled
                                        ? () async {
                                            if (form
                                                        .value['username'] ==
                                                    null ||
                                                form.value['password'] ==
                                                    null ||
                                                form.value['username']
                                                    .toString()
                                                    .isEmpty ||
                                                form.value['password']
                                                    .toString()
                                                    .isEmpty) {
                                              await CustomAlerts()
                                                  .asyncSimpleAlertDialog(
                                                      alignment:
                                                          Alignment.center,
                                                      context: loginContext,
                                                      children: [
                                                    CustomAlerts()
                                                        .notificationDialog(
                                                            context:
                                                                loginContext,
                                                            imageUrl:
                                                                "assets/error.png",
                                                            title: "Warning",
                                                            subtitle:
                                                                "All fields are required!",
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                            type:
                                                                "table-heading",
                                                            buttonLabel: "Ok")
                                                  ]);
                                              return;
                                            }

                                            BlocProvider.of<LoginBloc>(
                                                    loginContext)
                                                .add(
                                                    LoginFormSubmittedEvent(
                                                        username: form
                                                            .value['username']
                                                            .toString(),
                                                        password: form
                                                            .value['password']
                                                            .toString()));
                                          }
                                        : null,
                                    style: isUsernameInputFilled &&
                                            isPasswordInputFilled
                                        ? elevatedMinButtonStyle
                                        : elevatedMinButtonLightStyle,
                                    child: const Text(
                                      "Login",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: size5),
                                Expanded(
                                  child: OutlinedButton(
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const CreateAccountView()),
                                      );
                                    },
                                    style: elevatedMinOutlineButtonStyle,
                                    child: const Text(
                                      "Sign Up",
                                      style: TextStyle(color: primaryColor),
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
