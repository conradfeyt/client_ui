import 'package:flutter/material.dart';

import 'custom_colors.dart';

class CheckboxElements {
  static ThemeData unselectedColorTheme() {
    return ThemeData(unselectedWidgetColor: const Color(0xffffffff));
  }

  static Color hoverColor() {
    return Colors.transparent;
  }

  static Color checkColor() {
    return CustomColors.primary;
  }

  static Color activeColor() {
    return Colors.transparent;
  }
}
