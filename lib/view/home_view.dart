import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:kawereeze/theme/theme.dart';
import 'package:kawereeze/view/index.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final introKey = GlobalKey<IntroductionScreenState>();

  // void _onIntroEnd(context) {
  //   Navigator.of(context).push(
  //     MaterialPageRoute(builder: (_) => const LoginView()),
  //   );
  // }

  // Widget _buildImage(String assetName, [double width = 300]) {
  //   return Image.asset(assetName, width: width);
  // }

  @override
  Widget build(BuildContext context) {
    // const pageDecoration = introPageDecoration;

    return const SafeArea(child: LoginView());

    // return SafeArea(
    //   child: IntroductionScreen(
    //     key: introKey,
    //     globalBackgroundColor: Colors.white,
    //     pages: [
    //       PageViewModel(
    //         title: "Money Transfer Made Easy",
    //         body: '',
    //         image: _buildImage('assets/faster_transfer.jpg'),
    //         decoration: pageDecoration,
    //       ),
    //       PageViewModel(
    //         title: "Faster transfers. Efficient service. Great rates",
    //         body: '',
    //         image: _buildImage('assets/easy_transfer.jpg'),
    //         decoration: pageDecoration,
    //       ),
    //       PageViewModel(
    //         title: "Register and Get Started with Kawereeze",
    //         body: '',
    //         image: _buildImage('assets/sign_up.jpg'),
    //         decoration: pageDecoration,
    //       ),
    //     ],
    //     onDone: () => _onIntroEnd(context),
    //     onSkip: () => {
    //       Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginView()))
    //     },
    //     showSkipButton: true,
    //     skipOrBackFlex: 0,
    //     nextFlex: 0,
    //     showBackButton: false,
    //     back: const Text('Previous', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black)),
    //     skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black)),
    //     next: const Text('Next', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black)),
    //     done: const Text('Get Started', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black)),
    //     curve: Curves.fastLinearToSlowEaseIn,
    //     controlsMargin: const EdgeInsets.all(16),
    //     controlsPadding: kIsWeb
    //         ? const EdgeInsets.all(12.0)
    //         : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
    //     dotsDecorator: introDotsDecoration,
    //     dotsContainerDecorator: introDotsContainerDecoration,
    //   ),
    // );
  }
}
