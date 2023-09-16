import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kawereeze/repositories/transaction_repository.dart';
import 'package:kawereeze/view/index.dart';
import 'package:kawereeze/view/widget/index.dart';
import 'package:kawereeze/view/widget/kw_block_table.dart';

import '../blocs/transaction/transaction_bloc.dart';
import '../model/user.dart';
import '../theme/theme.dart';
import 'otp_verification/verify_identity_view.dart';

class TransactionView extends StatefulWidget {
  const TransactionView({Key? key, required this.user}) : super(key: key);
  final User? user;

  @override
  State<TransactionView> createState() => _TransactionViewState();
}

class _TransactionViewState extends State<TransactionView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Transactions'.toUpperCase(),
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: backgroundColor,
        leading: KwIconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => WelcomeView(
                          user: widget.user,
                        )));
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_sharp,
            size: size30,
          ),
        ),
      ),
      body: BlocProvider<TransactionBloc>(
        create: (context) =>
            TransactionBloc(transactionRepository: TransactionRepository()),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
                left: size28, right: size28, bottom: size20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                KwBlockTable(
                    payOffDate: '2023-08-24 23:52:47',
                    orderNo: '3035569163',
                    loanAmount: '100,000',
                    term: '2 months',
                    installments: '2',
                    status: 'Paid Off'),
                const SizedBox(
                  height: size10,
                ),
                KwBlockTable(
                    payOffDate: '2023-08-24 23:52:47',
                    orderNo: '3035569163',
                    loanAmount: '100,000',
                    term: '2 months',
                    installments: '2',
                    status: 'Paid Off'),
                const SizedBox(
                  height: size10,
                ),
                KwBlockTable(
                    payOffDate: '2023-08-24 23:52:47',
                    orderNo: '3035569163',
                    loanAmount: '100,000',
                    term: '2 months',
                    installments: '2',
                    status: 'Paid Off'),
                const SizedBox(
                  height: size10,
                ),
                KwBlockTable(
                    payOffDate: '2023-08-24 23:52:47',
                    orderNo: '3035569163',
                    loanAmount: '100,000',
                    term: '2 months',
                    installments: '2',
                    status: 'Paid Off'),
                const SizedBox(
                  height: size10,
                ),
                KwBlockTable(
                    payOffDate: '2023-08-24 23:52:47',
                    orderNo: '3035569163',
                    loanAmount: '100,000',
                    term: '2 months',
                    installments: '2',
                    status: 'Paid Off'),
                const SizedBox(
                  height: size10,
                ),
                KwBlockTable(
                    payOffDate: '2023-08-24 23:52:47',
                    orderNo: '3035569163',
                    loanAmount: '100,000',
                    term: '2 months',
                    installments: '2',
                    status: 'Paid Off'),
                const SizedBox(
                  height: size10,
                ),
                KwBlockTable(
                    payOffDate: '2023-08-24 23:52:47',
                    orderNo: '3035569163',
                    loanAmount: '100,000',
                    term: '2 months',
                    installments: '2',
                    status: 'Paid Off'),
                const SizedBox(
                  height: size10,
                ),
                KwBlockTable(
                    payOffDate: '2023-08-24 23:52:47',
                    orderNo: '3035569163',
                    loanAmount: '100,000',
                    term: '2 months',
                    installments: '2',
                    status: 'Paid Off'),
                const SizedBox(
                  height: size10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
