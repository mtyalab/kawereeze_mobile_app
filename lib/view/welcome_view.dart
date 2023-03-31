import 'package:flutter/material.dart';
import 'package:kawereeze/view/index.dart';
import 'package:kawereeze/view/widget/index.dart';
import 'package:intl/intl.dart';

import '../model/user.dart';
import '../theme/theme.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({Key? key, required this.user}) : super(key: key);
  final User? user;

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {

  @override
  Widget build(BuildContext context) {

    DateTime today = DateTime.now();


    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: size19),
                  decoration: const BoxDecoration(
                      color: primaryColorBk,
                      image: DecorationImage(
                          image: AssetImage('assets/background.jpg'),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(size20),
                          bottomRight: Radius.circular(size20))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: size19, top: size20),
                        child: KwTitle(
                          type: 'date',
                          title: '${DateFormat.yMMMMEEEEd().format(today)}',
                        ),
                      ),
                       Padding(
                        padding: EdgeInsets.only(left: size19, bottom: size5),
                        child: KwTitle(
                          type: 'welcome',
                          title: 'Welcome ${widget.user!.firstName}',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: size22),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SedMoneyCard(label: 'Send Money', user: widget.user,),
                            Spacer(),
                           InitiateReversalCard(label: 'Initiate Reversal', user: widget.user,),
                            const SizedBox(
                              width: size20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                RecipientTable(user: widget.user)
              ],
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
      ),
    );
  }
}
