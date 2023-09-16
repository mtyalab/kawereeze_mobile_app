import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:kawereeze/view/index.dart';
import 'package:kawereeze/view/welcome_view.dart';
import 'package:kawereeze/view/widget/index.dart';
import 'package:kawereeze/view/widget/kw_profile_strip.dart';
import 'package:kawereeze/view/widget/kw_single_line_text_strip.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../model/user.dart';
import '../theme/theme.dart';
import 'login_view.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key, this.user}) : super(key: key);
  final User? user;


  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  int _index = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Profile'.toUpperCase(),
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),

          ),
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_sharp,
              )),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
                left: size28, right: size28, top: size20, bottom: size20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children:  [
              KwProfileStrip(
                  placeholder: 'assets/recipient.jpg',
                  profileName: '${widget.user!.firstName} ${widget.user!.surname}',
                  email: '${widget.user!.email}',
                  phoneNumber: '${widget.user!.phoneNumber}',
                ),
              const  SizedBox(
                  height: size30,
                ),
                InkWell(
                  onTap: () {
                    print('Coming soon');
                  },
                  child: const  KwSingleLineTextStrip(
                    title: 'Terms & Conditions',
                    widget: const Icon(Icons.info_outline),
                  ),
                ),
                const  Divider(height: 0.3,),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => TransactionView(user: widget.user)));
                  },
                  child: const  KwSingleLineTextStrip(
                    title: 'Transactions',
                    widget: Icon(Icons.money),
                  ),
                ),
                const  Divider(height: 0.3,),
              const  KwSingleLineTextStrip(
                  title: 'Version',
                  widget: Text('1.0.0'),
                ),
              const  Divider(height: 0.3,),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginView()));
                  },
                  child: KwSingleLineTextStrip(
                    title: 'Log Out',
                    widget: const Icon(Icons.logout_outlined),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(left: size10, right: size5),
          child: SalomonBottomBar(
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
