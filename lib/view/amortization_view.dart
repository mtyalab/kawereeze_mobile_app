import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_selector/widget/flutter_single_select.dart';
import 'package:kawereeze/repositories/verification_repository.dart';
import 'package:kawereeze/theme/theme.dart';
import 'package:kawereeze/view/welcome_view.dart';
import 'package:kawereeze/view/widget/index.dart';

import '../blocs/verification/verification_bloc.dart';
import '../model/user.dart';
import 'package:file_picker/file_picker.dart';

import '../utils/custom_alerts.dart';


class AmortizationView extends StatefulWidget {
  const AmortizationView(
      {super.key, required this.amount, required this.dueDate,  this.user});
  final dynamic amount;
  final dynamic dueDate;
  final User? user;

  @override
  State<AmortizationView> createState() => _AmortizationViewState();
}

class _AmortizationViewState extends State<AmortizationView> {
  String idType = "";


  final TextEditingController _idTypeController = TextEditingController();
  final TextEditingController _selfieController = TextEditingController();
  final TextEditingController _idController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selfieController.addListener(_onSelfieFileChanged);
    _idController.addListener(_onIdFileChanged);
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    double deviceWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Amortization Schedule'.toUpperCase(),
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
          leading: KwIconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_sharp,
              size: size30,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: size20),
              KwAmortizationScheduleWidget(loanAmount: double.parse(widget.amount), loanTermMonths: int.parse(widget.dueDate), interestRate: 2.0),
              Padding(
                padding: const EdgeInsets.only(left: size20, right: size20, bottom: size40),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          isDismissible: false,
                          enableDrag: true,
                          context: context,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(size30),
                                  topRight: Radius.circular(size30))),
                          builder: (BuildContext modalContext) {
                            return Container(
                                padding: EdgeInsets.only(
                                    bottom: mediaQueryData.viewInsets.bottom),
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(size20),
                                        topRight: Radius.circular(size20))),
                                child: Padding(
                                  padding:  EdgeInsets.only(
                                      left: size0,
                                      right: size0,
                                      bottom: size0,
                                      top: size0),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(size20))),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: size20,
                                          right: size20,
                                          bottom: size10),
                                      child: SingleChildScrollView(
                                        child: BlocProvider<VerificationBloc>(
                                          create: (atsContext) =>
                                              VerificationBloc(verificationRepo: VerificationRepo()),
                                          child: BlocConsumer<VerificationBloc,
                                              VerificationState>(
                                            listener: (atsContext, atsState) {
                                              // TODO: implement listener
                                              if (atsState.verificationViewUiFlow ==
                                                  VerificationViewUiFlow.add) {
                                                if (atsState.verificationViewUiState ==
                                                    VerificationViewUiState
                                                        .isLoadingComplete) {
                                                  // Navigate to next view
                                                } else if (atsState
                                                    .verificationViewUiState ==
                                                    VerificationViewUiState
                                                        .isLoadingFailed) {
                                                  CustomAlerts()
                                                      .asyncSimpleAlertDialog(
                                                      alignment:
                                                      Alignment.center,
                                                      context: context,
                                                      children: [
                                                        CustomAlerts()
                                                            .notificationDialog(
                                                            context: context,
                                                            imageUrl:
                                                            "assets/error.png",
                                                            title:
                                                            "${atsState.message}!",
                                                            subtitle:
                                                            "Please try again.",
                                                            onPressed: () {
                                                              Navigator.of(
                                                                  context)
                                                                  .pop();
                                                            },
                                                            type:
                                                            "table-heading",
                                                            buttonLabel: "Ok"),
                                                      ]);
                                                }
                                              }
                                            },
                                            builder: (atsContext, atsState) {
                                              if (atsState.verificationViewUiFlow ==
                                                  VerificationViewUiFlow.add) {
                                                if (atsState.verificationViewUiState ==
                                                    VerificationViewUiState.isLoading) {
                                                  return Center(
                                                    child: Container(
                                                      padding:
                                                      const EdgeInsets.only(
                                                          top: size100,
                                                          bottom: size100),
                                                      child: const CircularProgressIndicator(),
                                                    ),
                                                  );
                                                }
                                              }

                                              return Padding(
                                                padding: EdgeInsets.only(
                                                  bottom: MediaQuery.of(context)
                                                      .viewInsets
                                                      .bottom,
                                                ),
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    const SizedBox(height: size10),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Icon(Icons.upload),
                                                        const Text(
                                                          'Upload Verification details',
                                                          style: TextStyle(
                                                              fontWeight:
                                                              FontWeight.w600,
                                                              fontSize: size18),
                                                        ),
                                                      ],
                                                    ),

                                                    SizedBox(
                                                      width: deviceWidth,
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: <Widget>[
                                                          const SizedBox(
                                                            height: size15,
                                                          ),
                                                          CustomSingleSelectField<String>(
                                                            items: ["National ID", "Passport"],
                                                            title: "Identification Type",
                                                            initialValue: idType,
                                                            onSelectionDone: (value) {
                                                              setState(() {
                                                                idType = value;
                                                              });
                                                            },
                                                            itemAsString: (item) => item,
                                                          ),
                                                        ],
                                                      ),
                                                    ),

                                                    const SizedBox(
                                                      height: size10,
                                                    ),
                                                    SizedBox(
                                                      width: double.infinity,
                                                      child: OutlinedButton(
                                                        style: OutlinedButton.styleFrom(
                                                          side: BorderSide(width: 0.5, color: primaryColor),
                                                        ),
                                                        onPressed: () =>
                                                            _selectIdImage(),
                                                        child: Row(
                                                          children: [
                                                            const Icon(Icons.image, color: primaryColor),
                                                            const SizedBox(width: size10,),
                                                            Expanded(
                                                              child: TextField(
                                                                controller: _idController,
                                                                enabled: false,
                                                                style: const TextStyle(
                                                                  color: Colors.grey,
                                                                ),
                                                                decoration: const InputDecoration(
                                                                  border: InputBorder.none,
                                                                  hintText: 'Upload Id',
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: size10,
                                                    ),
                                                    SizedBox(
                                                      width: double.infinity,
                                                      child: OutlinedButton(
                                                        style: OutlinedButton.styleFrom(
                                                          side: BorderSide(width: 0.5, color: primaryColor),
                                                        ),
                                                        onPressed: () =>
                                                            _selectSelfieImage(),
                                                        child: Row(
                                                          children: [
                                                            const Icon(Icons.image, color: primaryColor),
                                                            const SizedBox(width: size10,),
                                                            Expanded(
                                                              child: TextField(
                                                                controller: _selfieController,
                                                                enabled: false,
                                                                style: const TextStyle(
                                                                  color: Colors.grey,
                                                                ),
                                                                decoration: const InputDecoration(
                                                                  border: InputBorder.none,
                                                                  hintText: 'Upload Selfie',
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: size20,
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(bottom: size10, top: size15),
                                                      child: SizedBox(
                                                        width: double.infinity,
                                                        child: ElevatedButton(
                                                          style:
                                                          primaryButtonStyle,
                                                          onPressed: () {

                                                            CustomAlerts()
                                                                .asyncSimpleAlertDialog(
                                                                alignment:
                                                                Alignment.center,
                                                                context: context,
                                                                children: [
                                                                  CustomAlerts()
                                                                      .notificationDialog(
                                                                      context: context,
                                                                      imageUrl:
                                                                      "assets/success.png",
                                                                      title:
                                                                      "Hooray!!!",
                                                                      subtitle:
                                                                      "Loan request has successfully\n been submitted.\n"
                                                                          " Give up to 24 hours in order\n for it to be processed",
                                                                      onPressed: () {
                                                                        Navigator.pushReplacement(
                                                                            context,
                                                                            MaterialPageRoute(
                                                                                builder: (context) => WelcomeView(
                                                                                  user: widget.user,
                                                                                )));
                                                                      },
                                                                      type:
                                                                      "table-heading",
                                                                      buttonLabel: "Ok"),
                                                                ]);

                                                            // atsContext
                                                            //     .read<
                                                            //     VerificationBloc>()
                                                            //     .add(AddIdentityEvent(
                                                            //     userId: widget.user!.id,
                                                            //     idType:
                                                            //     idType,
                                                            //     selfieUrl:
                                                            //     _selfieController
                                                            //         .text,
                                                            //     idUrl:
                                                            //     _idController.text));
                                                          },
                                                          child: const Padding(
                                                            padding:
                                                            EdgeInsets.all(
                                                                size15),
                                                            child: Text('Submit', style: TextStyle(color: Colors.white),),
                                                          ),
                                                        ),
                                                      ),
                                                    ),

                                                    SizedBox(
                                                      width: double.infinity,
                                                      child: ElevatedButton(
                                                        style:
                                                        primaryButtonStyleDark,
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: const Padding(
                                                          padding:
                                                          EdgeInsets.all(
                                                              size15),
                                                          child: Text('Cancel', style: TextStyle(color: Colors.white),),
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: size40,
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ));
                          });

                    },
                    style: elevatedMinButtonStyle,
                    child: Text(
                      'Confirm Request',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectSelfieImage() async {

    final result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null && result.files.isNotEmpty) {
      setState(() {
        _selfieController.text = result.files.first.path!;
      });
    }

  }

  void _onSelfieFileChanged() {
    final filePath = _selfieController.text;
    if (filePath.isNotEmpty) {
      filePath;
    }
  }

  Future<void> _selectIdImage() async {

    final result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null && result.files.isNotEmpty) {
      setState(() {
        _idController.text = result.files.first.path!;
      });
    }

  }

  void _onIdFileChanged() {
    final filePath = _idController.text;
    if (filePath.isNotEmpty) {
      filePath;
    }
  }
  @override
  void dispose() {
    _idTypeController.dispose();
    _selfieController.dispose();

    super.dispose();
  }
}
