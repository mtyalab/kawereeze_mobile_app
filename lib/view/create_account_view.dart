import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kawereeze/blocs/signup/signup_bloc.dart';
import 'package:kawereeze/model/user.dart';
import 'package:kawereeze/repositories/auth_repository.dart';
import 'package:kawereeze/view/index.dart';
import 'package:kawereeze/view/widget/index.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../theme/theme.dart';
import '../utils/custom_alerts.dart';
import 'otp_verification/verify_identity_view.dart';

class CreateAccountView extends StatefulWidget {
  const CreateAccountView({Key? key}) : super(key: key);

  @override
  State<CreateAccountView> createState() => _CreateAccountViewState();
}

class _CreateAccountViewState extends State<CreateAccountView> {
  final form = FormGroup({
    'firstName': FormControl<String>(validators: [Validators.required]),
    'surname': FormControl<String>(validators: [Validators.required]),
    'phoneNumber': FormControl<String>(validators: [Validators.required]),
    'email': FormControl<String>(
        validators: [Validators.email, Validators.required]),
    'password': FormControl<String>(validators: [Validators.required]),
  });

  bool _passwordVisible = true;
  TextEditingController firstName = TextEditingController();
  TextEditingController surname = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool isFirstNameInputFilled = false;
  bool isSurnameInputFilled = false;
  bool isPhoneNumberInputFilled = false;
  bool isEmailInputFilled = false;
  bool isPasswordInputFilled = false;
  void _showPassword() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    inputListeners();
  }

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
          onPressed: () => {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginView()),
            )
          },
        ),
      ),
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin:
                  const EdgeInsets.only(top: 0, left: size20, right: size20),
              child: BlocProvider<SignupBloc>(
                create: (signUpContext) => SignupBloc(AuthRepository()),
                child: ReactiveForm(
                  formGroup: form,
                  child: BlocConsumer<SignupBloc, SignupState>(
                    listener: (signupContext, state) {
                      // TODO: implement listener
                      if (state.uiState == SignUpUIStage.SUCCESS) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  VerifyIdentityView(
                                  user: state.user,
                                      type: 'signup',
                                    )));
                      }

                      if (state.uiState == SignUpUIStage.FAILURE) {
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
                      }

                      if (state.uiState == SignUpUIStage.LOADING) {
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
                                subtitle: 'Creating account ...',
                                type: "table-heading",
                              )
                            ]);
                      }
                    },
                    builder: (context, state) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Create an account',
                            style: kwTitle5Style,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          bottom: size5, top: size8),
                                      child: Text(
                                        'First Name',
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ),
                                    KwTextInput(
                                      controller: firstName,
                                      autoFocus: true,
                                      formControlName: 'firstName',
                                      obsecureText: false,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: size7,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          bottom: size5, top: size10),
                                      child: Text(
                                        'Surname',
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ),
                                    KwTextInput(
                                      controller: surname,
                                      autoFocus: true,
                                      formControlName: 'surname',
                                      obsecureText: false,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          const Padding(
                            padding:
                                EdgeInsets.only(bottom: size5, top: size10),
                            child: Text(
                              'Phone Number',
                              style: TextStyle(fontWeight: FontWeight.normal),
                            ),
                          ),
                          KwTextInput(
                            controller: phoneNumber,
                            autoFocus: true,
                            formControlName: 'phoneNumber',
                            obsecureText: false,
                          ),
                          const Padding(
                            padding:
                                EdgeInsets.only(bottom: size5, top: size10),
                            child: Text(
                              'Email',
                              style: TextStyle(fontWeight: FontWeight.normal),
                            ),
                          ),
                          KwTextInput(
                            controller: email,
                            autoFocus: true,
                            formControlName: 'email',
                            obsecureText: false,
                          ),
                          Row(
                            children: const [
                              Padding(
                                padding:
                                    EdgeInsets.only(bottom: size5, top: size10),
                                child: Text(
                                  'Password',
                                  style:
                                      TextStyle(fontWeight: FontWeight.normal),
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
                          const SizedBox(
                            height: size10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: isFirstNameInputFilled &&
                                          isSurnameInputFilled &&
                                          isPhoneNumberInputFilled &&
                                          isEmailInputFilled &&
                                          isPasswordInputFilled
                                      ? () {
                                          BlocProvider.of<SignupBloc>(context)
                                              .add(SignUpFormEvent(
                                            firstName: form.value['firstName']
                                                .toString(),
                                            surname: form.value['surname']
                                                .toString(),
                                            phoneNumber: form
                                                .value['phoneNumber']
                                                .toString(),
                                            email:
                                                form.value['email'].toString(),
                                            password: form.value['password']
                                                .toString(),
                                          ));
                                        }
                                      : null,
                                  style: elevatedMinButtonStyle,
                                  child: const Text(
                                    "Submit",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: size5,
                              ),
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
                            ],
                          ),
                          const SizedBox(
                            height: size50,
                          )
                        ],
                      );
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void inputListeners() {
    firstName.addListener(() {
      setState(() {
        if (firstName.text.isNotEmpty && firstName.text.length >= 3) {
          isFirstNameInputFilled = true;
        }
      });
    });

    surname.addListener(() {
      setState(() {
        if (surname.text.isNotEmpty && surname.text.length >= 3) {
          isSurnameInputFilled = true;
        }
      });
    });

    phoneNumber.addListener(() {
      setState(() {
        if (phoneNumber.text.isNotEmpty && phoneNumber.text.length >= 9) {
          isPhoneNumberInputFilled = true;
        }
      });
    });

    email.addListener(() {
      setState(() {
        if (email.text.isNotEmpty && email.text.length >= 9) {
          isEmailInputFilled = true;
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
}
