import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kawereeze/repositories/transaction_repository.dart';
import 'package:kawereeze/view/index.dart';
import 'package:kawereeze/view/widget/index.dart';

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
        title: const Text(
          'Transactions',
          style: kwTitleStyle,
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
            Icons.chevron_left_outlined,
            size: size30,
            color: Colors.black,
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
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VerifyIdentityView(
                                  type: 'reversal',
                                  user: widget.user,
                                )));
                  },
                  child: const KwTable(
                    placeholder: 'assets/recipient.jpg',
                    status: 'successful',
                    recipientName: 'Krista Mutyaba',
                    transactionDate: '10 days ago',
                    transactionNumber: '3035569163',
                    amount: 1000000,
                  ),
                ),
                const SizedBox(
                  height: size10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VerifyIdentityView(
                                  type: 'reversal',
                                  user: widget.user,
                                )));
                  },
                  child: const KwTable(
                    placeholder: 'assets/recipient.jpg',
                    status: 'successful',
                    recipientName: 'Krista Mutyaba',
                    transactionDate: '10 days ago',
                    transactionNumber: '3035569163',
                    amount: 1000000,
                  ),
                ),
                const SizedBox(
                  height: size10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VerifyIdentityView(
                                  type: 'reversal',
                                  user: widget.user,
                                )));
                  },
                  child: const KwTable(
                    placeholder: 'assets/recipient.jpg',
                    status: 'successful',
                    recipientName: 'Krista Mutyaba',
                    transactionDate: '10 days ago',
                    transactionNumber: '3035569163',
                    amount: 1000000,
                  ),
                ),
                const SizedBox(
                  height: size10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VerifyIdentityView(
                                  type: 'reversal',
                                  user: widget.user,
                                )));
                  },
                  child: const KwTable(
                    placeholder: 'assets/recipient.jpg',
                    status: 'successful',
                    recipientName: 'Krista Mutyaba',
                    transactionDate: '10 days ago',
                    transactionNumber: '3035569163',
                    amount: 1000000,
                  ),
                ),
                const SizedBox(
                  height: size10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VerifyIdentityView(
                                  type: 'reversal',
                                  user: widget.user,
                                )));
                  },
                  child: const KwTable(
                    placeholder: 'assets/recipient.jpg',
                    status: 'successful',
                    recipientName: 'Krista Mutyaba',
                    transactionDate: '10 days ago',
                    transactionNumber: '3035569163',
                    amount: 1000000,
                  ),
                ),
                const SizedBox(
                  height: size10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VerifyIdentityView(
                                  type: 'reversal',
                                  user: widget.user,
                                )));
                  },
                  child: const KwTable(
                    placeholder: 'assets/recipient.jpg',
                    status: 'successful',
                    recipientName: 'Krista Mutyaba',
                    transactionDate: '10 days ago',
                    transactionNumber: '3035569163',
                    amount: 1000000,
                  ),
                ),
                const SizedBox(
                  height: size10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VerifyIdentityView(
                                  type: 'reversal',
                                  user: widget.user,
                                )));
                  },
                  child: const KwTable(
                    placeholder: 'assets/recipient.jpg',
                    status: 'successful',
                    recipientName: 'Krista Mutyaba',
                    transactionDate: '10 days ago',
                    transactionNumber: '3035569163',
                    amount: 1000000,
                  ),
                ),
                const SizedBox(
                  height: size10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VerifyIdentityView(
                                  type: 'reversal',
                                  user: widget.user,
                                )));
                  },
                  child: const KwTable(
                    placeholder: 'assets/recipient.jpg',
                    status: 'successful',
                    recipientName: 'Krista Mutyaba',
                    transactionDate: '10 days ago',
                    transactionNumber: '3035569163',
                    amount: 1000000,
                  ),
                ),
                const SizedBox(
                  height: size10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VerifyIdentityView(
                                  type: 'reversal',
                                  user: widget.user,
                                )));
                  },
                  child: const KwTable(
                    placeholder: 'assets/recipient.jpg',
                    status: 'successful',
                    recipientName: 'Krista Mutyaba',
                    transactionDate: '10 days ago',
                    transactionNumber: '3035569163',
                    amount: 1000000,
                  ),
                ),
                const SizedBox(
                  height: size10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VerifyIdentityView(
                                  type: 'reversal',
                                  user: widget.user,
                                )));
                  },
                  child: const KwTable(
                    placeholder: 'assets/recipient.jpg',
                    status: 'successful',
                    recipientName: 'Krista Mutyaba',
                    transactionDate: '10 days ago',
                    transactionNumber: '3035569163',
                    amount: 1000000,
                  ),
                ),
                const SizedBox(
                  height: size10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VerifyIdentityView(
                                  type: 'reversal',
                                  user: widget.user,
                                )));
                  },
                  child: const KwTable(
                    placeholder: 'assets/recipient.jpg',
                    status: 'successful',
                    recipientName: 'Krista Mutyaba',
                    transactionDate: '10 days ago',
                    transactionNumber: '3035569163',
                    amount: 1000000,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: KwFloatingButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ProfileView()));
        },
        icon: const Icon(
          Icons.account_circle_outlined,
          color: Colors.white,
        ),
      ),
    );
  }
}
