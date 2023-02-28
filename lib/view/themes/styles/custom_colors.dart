import 'package:flutter/material.dart';

class MyColor extends MaterialStateColor {
  const MyColor() : super(_defaultColor);

  static const int _defaultColor = 0xcafefeed;
  static const int _pressedColor = 0xdeadbeef;

  @override
  Color resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.pressed)) {
      return const Color(_pressedColor);
    }
    return const Color(_defaultColor);
  }
}

class CustomColors {
  static const primary = Color(0xFF7B2EFF);
  static const primaryDark = Color(0xFF591EBE);
  static const primaryLight = Color(0xFFF2EBFF);
  static const greyDark = Color(0xFF616161);
  static const grey = Color(0xFF808080);
  static const greyLight = Color(0xFFEBEBEB);
  static const placeholder_text_color = Color(0xFF808080);
  static const helper_text_color = Color(0xFF545454);
  static const black = Color(0xFF1F173D);
  static const white = Color(0xFFf2f2f2);
  static const linkBlue = Color(0xFF344cee);
  static const checkboxActive = Color(0xfffeffff);
  static const checkboxCheck = Color(0xfffeffff);
  static const materialSurfaceBackground = Color(0xFFFAFAFA);

  static const comprehensivePurple = Color(0xFFD1B8FF);
  static const eventOther = Color(0xffe8e67a);
  static const lensConsultationBlue = Color(0xffb4dadd);
  static const licencePink = Color(0xfff9c8bb);
  static const eventBlue = Color(0xFFB5C0CD);

  static const calendarHeadingWhite = Color(0xFFF3F3F3);

  static const greyVeryDark = Color(0xFF141414);
  static const purple = Color(0xFF570082);

  static const dividerGrey = Color(0xFFD9D9D9);

  static const odButton = Color(0xFF8A4B4D);
  static const osButton = Color(0xFF377BAF);
}
