import 'package:flutter/material.dart';

import 'custom_colors.dart';

class ShapeDecorations {


  static ShapeDecoration clinicalSmallButton(){
    return ShapeDecoration(
      color: CustomColors.primaryLight,
      shape: Border.all(color: Colors.transparent),
    );
  }


}
