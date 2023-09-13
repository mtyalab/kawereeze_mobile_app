import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

/// Set colors
const primaryColor = Color(0xff690168);
const primaryColorBk = Color(0xff7809f8);
const primaryLight = Color(0xffBA99FF);
const backgroundColor = Color(0xffF7F3FF);
const green = Colors.white;
const lightGreen = Colors.white;
const red = Colors.white;

/// Set sizes
const size2 = 2.0;
const size4 = 4.0;
const size5 = 5.0;
const size7 = 7.0;
const size8 = 8.0;
const size9 = 9.0;
const size10 = 10.0;
const size11 = 11.0;
const size12 = 12.0;
const size13 = 13.0;
const size15 = 15.0;
const size17 = 17.0;
const size18 = 18.0;
const size19 = 19.0;
const size20 = 20.0;
const size22 = 22.0;
const size25 = 25.0;
const size28 = 28.0;
const size30 = 30.0;
const size33 = 33.0;
const size40 = 40.0;
const size50 = 50.0;
const size70 = 70.0;
const size90 = 90.0;
const size100 = 100.0;
const size102 = 102.0;
const size107 = 107.0;
const size110 = 110.0;
const size113 = 113.0;
const size114 = 114.0;
const size170 = 170.0;
const size175 = 175.0;
const size200 = 200.0;
const size250 = 250.0;
const size320 = 320.0;
const size500 = 500.0;

const appBarText1 = TextStyle(
    fontSize: 16.0,
    color: Colors.white,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.3);

const appBarText2 =
    TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, letterSpacing: 0.3);

const bodyStyle = TextStyle(fontSize: 19.0);
const kwTitleStyle = TextStyle(fontSize: size15, fontWeight: FontWeight.w500);
const kwTitle5Style = TextStyle(fontSize: size19, fontWeight: FontWeight.bold, color: primaryColor);
const kwTitle4Style = TextStyle(fontSize: size19, fontWeight: FontWeight.w500);

const kwTitle6Style = TextStyle(fontSize: size30, fontWeight: FontWeight.bold, color: primaryColor);

const kwTitle2Style = TextStyle(
    fontSize: size25, fontWeight: FontWeight.bold, color: Colors.white);

const kwTitle3Style = TextStyle(
    fontSize: size15, fontWeight: FontWeight.normal, color: Color(0xE5E3E3FF));

const introPageDecoration = PageDecoration(
  titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
  bodyTextStyle: bodyStyle,
  bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
  pageColor: Colors.white,
  imagePadding: EdgeInsets.zero,
);

const introDotsDecoration = DotsDecorator(
  activeColor: primaryColor,
  size: Size(10.0, 10.0),
  color: Color(0xFFBDBDBD),
  activeSize: Size(22.0, 10.0),
  activeShape: RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(25.0)),
  ),
);

const introDotsContainerDecoration = ShapeDecoration(
  color: Colors.white,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
  ),
);

final elevatedMinButtonStyle = ElevatedButton.styleFrom(
    padding: const EdgeInsets.all(size10),
    backgroundColor: primaryColor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)));

final elevatedMinButtonLightStyle = ElevatedButton.styleFrom(
    padding: const EdgeInsets.all(size10),
    backgroundColor: primaryLight,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)));

final elevatedMinOutlineButtonStyle = ElevatedButton.styleFrom(
    padding: const EdgeInsets.all(size10),
    backgroundColor: Colors.white,
    side: const BorderSide(color: primaryColor, width: 0.4),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)));

ThemeData theme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  textTheme: const TextTheme(
    headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
    headline2: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
    bodyText1: TextStyle(fontSize: 12.0),
    bodyText2: TextStyle(fontSize: 14.0),
  ),
);
