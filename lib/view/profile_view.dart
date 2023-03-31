import 'package:flutter/material.dart';
import 'package:kawereeze/view/home_view.dart';
import 'package:kawereeze/view/widget/index.dart';
import 'package:kawereeze/view/widget/kw_profile_strip.dart';
import 'package:kawereeze/view/widget/kw_single_line_text_strip.dart';

import '../theme/theme.dart';
import 'login_view.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Profile',
          style: kwTitleStyle,
        ),
        automaticallyImplyLeading: false,
        backgroundColor: backgroundColor,
        leading: KwIconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.chevron_left_outlined,
            size: size30,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              left: size28, right: size28, bottom: size20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children:  [
            const  KwProfileStrip(
                placeholder: 'assets/recipient.jpg',
                profileName: 'Krista Mutyaba',
                email: 'mutyabakristaofficial@gmail.com',
                phoneNumber: '0783423397',
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
    );
  }
}
