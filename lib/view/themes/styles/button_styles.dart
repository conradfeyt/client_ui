import 'package:clinical_ui/view/themes/styles/custom_colors.dart';
import 'package:clinical_ui/view/themes/styles/text_styles.dart';
import 'package:flutter/material.dart';

class ButtonStyles {
  static ButtonStyle primaryButton({width = 100.0, height = 48.0}) {
    return ButtonStyle(
        shadowColor: MaterialStateProperty.all(Colors.transparent),
        textStyle: MaterialStateProperty.all(TextStyles.firaSemiBold()),
        minimumSize: MaterialStateProperty.all(Size(width, height)),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.hovered)) {
            return CustomColors.primaryDark;
          }
          return CustomColors.primary;
        }));
  }

  static ButtonStyle secondaryButton({width = 100.0, height = 48.0}) {
    return ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.transparent),
        shadowColor: MaterialStateProperty.all(Colors.transparent),
        //textStyle: MaterialStateProperty.all(TextStyles.firaSemiBold(color: Colors.red)),

        foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.hovered)) {
            return (CustomColors.primaryDark);
          }
          return (CustomColors.primary);
        }),
        textStyle: MaterialStateProperty.resolveWith<TextStyle>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.hovered)) {
            return (TextStyles.firaSemiBold(color: CustomColors.primaryDark));
          }
          return (TextStyles.firaSemiBold(color: CustomColors.primary));
        }),
        minimumSize: MaterialStateProperty.all(Size(width, height)),
        side: MaterialStateProperty.resolveWith<BorderSide>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.hovered)) {
            return const BorderSide(color: CustomColors.primaryDark, width: 2);
          }
          return const BorderSide(color: CustomColors.primary, width: 2);
        }));
  }

  static ButtonStyle loginButton() {
    return ElevatedButton.styleFrom(
      textStyle: TextStyles.firaSemiBold(),
      shadowColor: Colors.transparent,
      onPrimary: CustomColors.primary, //text
      primary: CustomColors.white, //background
      //side: BorderSide(color: Colors.black, width: 1),
      minimumSize: const Size(150, 50),
    );
  }

  static ButtonStyle circleButton() {
    return ElevatedButton.styleFrom(
      textStyle: TextStyles.firaSemiBold(),
      shadowColor: Colors.transparent,
      shape: const CircleBorder(),
      primary: const Color(0xFFf2f2f2), // <-- Button color
      onPrimary: CustomColors.primary, // <-- Splash color
    );
  }

  static ButtonStyle actionStripButton(bool active) {
    var bgColor = active ? Colors.white : (Colors.grey[850] ?? Colors.grey);
    return OutlinedButton.styleFrom(
      textStyle: TextStyles.firaSemiBold(),
      shadowColor: Colors.transparent,
      //padding: EdgeInsets.symmetric(vertical: 10.0),
      padding: const EdgeInsets.all(0),
      primary: bgColor,
      // side: BorderSide(color: Colors.black, width: 1),
      side: BorderSide(color: bgColor, width: 1),
      minimumSize: const Size(150, 50),
    );
  }

  static ButtonStyle actionStripButtonDisabled() {
    var bgColor = Colors.grey[850] ?? Colors.grey;
    return OutlinedButton.styleFrom(
      textStyle: TextStyles.firaSemiBold(),
      shadowColor: Colors.transparent,
      //padding: EdgeInsets.symmetric(vertical: 10.0),
      padding: const EdgeInsets.all(0),
      primary: bgColor,
      side: BorderSide(color: bgColor, width: 1),
      minimumSize: const Size(150, 50),
    );
  }

  static ButtonStyle sectionButtonSelected() {
    return TextButton.styleFrom(
      textStyle: const TextStyle(
        color: CustomColors.primary,
        fontWeight: FontWeight.w600,
        fontFamily: 'FiraGo',
      ),
    );
  }

  static ButtonStyle sectionButtonUnselected() {
    return TextButton.styleFrom(
      textStyle: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w400,
        fontFamily: 'FiraGo',
      ),
    );
  }

  static ButtonStyle fieldSetButton() {
    return TextButton.styleFrom(
      textStyle: const TextStyle(
        color: CustomColors.primaryDark,
        fontWeight: FontWeight.w400,
        fontSize: 32,
        fontFamily: 'FiraGo',
      ),
    );
  }
}
