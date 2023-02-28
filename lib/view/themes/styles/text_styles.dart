import 'package:flutter/material.dart';

import 'custom_colors.dart';

class TextStyles {
  static const Color _textGrey = Color(0xFF797979);
  static TextStyle successText() {
    return TextStyle(color: Colors.green[700]);
  }

  static TextStyle errorText() {
    return TextStyle(color: Colors.red[700]);
  }

  static TextStyle groupHeader({Color? color}) {
    color = color ?? CustomColors.greyLight;
    return TextStyle(
      color: color,
      fontSize: 32.0,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontFamily: 'Roboto-Regular',
    );
  }

  static TextStyle pageTitle({color = const Color(0xFF1F173D)}) {
    return TextStyle(
      color: color,
      fontSize: 28.0,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      fontFamily: 'FiraGO-SemiBold',
    );
  }

  static TextStyle sectionTitle({color = const Color(0xFF6300BF)}) {
    return TextStyle(
      color: color,
      fontSize: 24.0,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      fontFamily: 'Roboto-Medium',
    );
  }

  static TextStyle inputTitle({Color? color, size = 14.0}) {
    color = color ?? CustomColors.primary;
    return TextStyle(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      fontFamily: 'Roboto-Regular',
    );
  }

  static TextStyle nameListBold({selected = false, size = 17.0}) {
    var textDecoration =
        selected ? TextDecoration.underline : TextDecoration.none;
    return TextStyle(
      color: const Color(0xFF333333),
      fontSize: size,
      fontWeight: FontWeight.bold,
      fontFamily: 'Roboto-Regular',
      decoration: textDecoration,
    );
  }

  static TextStyle nameListMedium({selected = false, size = 17.0}) {
    var textDecoration =
        selected ? TextDecoration.underline : TextDecoration.none;
    return TextStyle(
      color: const Color(0xFF333333),
      fontSize: size,
      fontWeight: FontWeight.w400,
      fontFamily: 'Roboto-Medium',
      decoration: textDecoration,
    );
  }

  static TextStyle firaSemiBold(
      {selected = false, size = 16.0, color = Colors.black}) {
    return TextStyle(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.w600,
      fontFamily: 'FiraGo',
    );
  }

  static TextStyle firaRegular(
      {selected = false, size = 16.0, color = Colors.black}) {
    return TextStyle(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.normal,
      fontFamily: 'FiraGo',
    );
  }

  static TextStyle nameListNormal({selected = false, size = 17.0}) {
    var textDecoration =
        selected ? TextDecoration.underline : TextDecoration.none;
    return TextStyle(
      color: _textGrey,
      fontSize: size,
      fontWeight: FontWeight.normal,
      fontFamily: 'Roboto-Regular',
      decoration: textDecoration,
    );
  }

  static TextStyle boldText({size = 16.0, color = const Color(0xFF797979)}) {
    return TextStyle(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.bold,
      fontFamily: 'Roboto-Regular',
      decoration: TextDecoration.none,
    );
  }

  static TextStyle mediumText({
    Color? color,
    size = 16.0,
    weight = FontWeight.w500,
  }) {
    color = color ?? _textGrey;
    return TextStyle(
      color: color,
      fontSize: size,
      fontWeight: weight,
      fontFamily: 'Roboto-Medium',
      decoration: TextDecoration.none,
    );
  }

  static TextStyle thinText(
      {Color? color,
      size = 16.0,
      weight = FontWeight.w200,
      fontStyle = FontStyle.normal}) {
    color = color ?? _textGrey;
    return TextStyle(
      color: color,
      fontSize: size,
      fontWeight: weight,
      fontStyle: fontStyle,
      fontFamily: 'Roboto-Thin',
      decoration: TextDecoration.none,
    );
  }

  static TextStyle secondaryButton({size = 14.0}) {
    return TextStyle(
      fontSize: size,
      color: CustomColors.greyDark,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle selectableListElement({size = 16.0}) {
    return TextStyle(
      fontSize: size,
      color: CustomColors.linkBlue,
      fontFamily: 'Roboto-Thin',
      fontWeight: FontWeight.w200,
      decoration: TextDecoration.underline,
    );
  }

  static TextStyle underlineText(
      {size = 16.0, color, weight = FontWeight.w500}) {
    color = color ?? CustomColors.primary;
    return TextStyle(
      fontSize: size,
      color: color,
      fontFamily: 'Roboto-Medium',
      fontWeight: weight,
      decoration: TextDecoration.underline,
    );
  }

  static TextStyle messageAnnotation() {
    return const TextStyle(
      color: CustomColors.grey,
      fontSize: 12,
      fontWeight: FontWeight.normal,
      fontFamily: 'FiraGo',
      decoration: TextDecoration.none,
    );
  }

  static TextStyle tableHeading() {
    return const TextStyle(
      color: CustomColors.black,
      fontSize: 18,
      fontWeight: FontWeight.w500,
      fontFamily: 'FiraGo-Medium',
      decoration: TextDecoration.none,
    );
  }

  static TextStyle tableData({color = CustomColors.black}) {
    return TextStyle(
      color: color,
      fontSize: 15,
      fontWeight: FontWeight.w500,
      fontFamily: 'FiraGo-Regular',
      decoration: TextDecoration.none,
    );
  }
}
