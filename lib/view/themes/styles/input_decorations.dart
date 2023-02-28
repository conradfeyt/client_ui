import 'package:clinical_ui/view/themes/styles/styles.dart';
import 'package:flutter/material.dart';

class InputDecorations {
  static get _transparentBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(0),
        borderSide: const BorderSide(
            color: Colors.transparent,
            width: 0), // need to check input colors on other inputs
      );

  static InputDecoration clinicalNumberFormField(
          {String? labelText,
          String? helperText,
          String? hintText,
          Color textColor = Colors.black,
          bool isDense = false}) =>
      InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
            backgroundColor: CustomColors.materialSurfaceBackground,
            color: textColor),
        contentPadding: const EdgeInsets.all(10),
        helperText: helperText,
        filled: true,
        fillColor: CustomColors.materialSurfaceBackground,
        helperStyle: helperText != null ? null : null,
        isDense: isDense,
        // fillColor: Colors.white, // need to check theme data to see if necessary
        hintText: hintText,
        focusedBorder:
            _transparentBorder, // need to check input colors on other inputs
        enabledBorder: _transparentBorder,
        disabledBorder: _transparentBorder,
        errorBorder: _transparentBorder,
        focusedErrorBorder: _transparentBorder,
        errorStyle: null,
      );
}
