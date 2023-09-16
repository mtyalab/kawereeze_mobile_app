import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:kawereeze/view/index.dart';
import 'package:kawereeze/view/widget/index.dart';
import 'package:intl/intl.dart';
import 'package:kawereeze/view/widget/kw_selector.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../model/user.dart';
import '../theme/theme.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({Key? key, required this.user}) : super(key: key);
  final User? user;

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {

    DateTime today = DateTime.now();


    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Home'.toUpperCase(),
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            automaticallyImplyLeading: false,
            centerTitle: true,
            leading: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.refresh,
                )),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginView()));
                },
                icon:
                const Icon(Icons.logout,),
              ),
            ],
          ),
          backgroundColor: backgroundColor,
          body: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: size19),
                  width: double.infinity,
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
                        padding: EdgeInsets.only(left: size19),
                        child: KwTitle(
                          type: 'welcome',
                          title: 'Welcome ${widget.user!.firstName}',
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: size20, top: size10, bottom: 0),
                  child: KwTitle(title: 'LOAN SIMULATOR', type: 'other', ),
                ),
                KwCardLg(
                  content: [
                    SizedBox(height: 3,),
                    KwTitle(
                      title: 'How much do you want to borrow?',
                      type: 'other',),
                    KwSelector(
                      title: 'UGX',
                      dataString: List<String>.generate(
                        (1000000 - 100000) ~/ 50000 + 1,
                            (index) => (100000 + (index * 50000)).toString(),
                      ),
                    ),

                    KwTitle(
                      title: 'When do you expect to settle your Loan?',
                      type: 'other',),
                    KwSelector(
                      title: 'MONTHS',
                      dataString: [
                        "1",
                        "2",
                        "3",
                        "4",
                        "5",
                        "6"
                      ],
                    ),
                    KwTitle(
                      title: 'What interest rate is offered?',
                      type: 'other',),
                    Text("We offer an interest rate of 2% Per Month Only"),
                    SizedBox(height: size10,),
                  ],
                ),
                const SizedBox(
                  width: size5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: size20, right: size20),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {

                      },
                      style: elevatedMinButtonStyle,
                      child: Text(
                        'Submit Request',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: size20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: size20, right: size20),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/gift.png',
                        width: 80,
                        height: 80,
                      ),
                      KwTitle(
                        title: 'Maintaining a good record will lead\n to an agreed discount on your loan.',
                        type: 'other',),
                    ],
                  ),
                ),
                SizedBox(height: size10,)
              ],
            ),
          ),
          bottomNavigationBar: SalomonBottomBar(
            backgroundColor: Colors.white,
            onTap: (int val) => setState(() => {
              _index = val,
              if (_index == 0) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => WelcomeView(user: widget.user)))
              } else if (_index == 1) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProfileView(user: widget.user,)))
              }
            }),
            currentIndex: _index,
            items: [
              SalomonBottomBarItem(
                icon: Icon(Icons.home_filled),
                title: Text("Home"),
                selectedColor: Colors.purple,
              ),

              /// Profile
              SalomonBottomBarItem(
                icon: Icon(Icons.account_circle),
                title: Text("Profile"),
                selectedColor: Colors.purple,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
