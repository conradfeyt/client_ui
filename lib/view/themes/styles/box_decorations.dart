import 'package:flutter/material.dart';

// import 'package:clinical_ui/models/calendar/booking.dart';

import 'custom_colors.dart';

enum InputState { initial, focused, error, validated }

extension InputStateColor on InputState {
  static const colors = {
    InputState.initial: Colors.black,
    InputState.focused: CustomColors.primary,
    InputState.error: Colors.red, // TODO: check correct color
    InputState.validated: Colors.green, // TODO: check correct color
  };
  Color get color => colors[this]!;
}

enum Booking {
  other,
  comprehensiveExamination,
  contactLensConsultation,
  driversLicenseScreening
}

class BoxDecorations {
  static BoxDecoration inputTextBox() {
    return BoxDecoration(
        border: Border.all(
      color: const Color(0xFFE1E1E1),
      width: 1,
    ));
  }

  static BoxDecoration numberInputBox({InputState state = InputState.initial}) {
    return BoxDecoration(
      // color: const Color(0xFFE1E1E1),
      borderRadius: const BorderRadius.all(
        Radius.circular(5),
      ),
      border: Border.all(
        color: state.color,
        width: 2.0,
      ),
    );
  }

  static BoxDecoration iconButton() {
    return BoxDecoration(
      border: Border.all(
        color: CustomColors.primary,
        width: 1,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(5)),
    );
  }

  static BoxDecoration checkBoxBorder({color}) {
    color = color ?? const Color(0xFF333333);
    return BoxDecoration(
      border: Border.all(color: color, width: 2),
      borderRadius: const BorderRadius.all(
        Radius.circular(5),
      ),
    );
  }

  static BoxDecoration tooltipBorder() {
    return BoxDecoration(
        color: Colors.white,
        border: Border.all(color: CustomColors.greyLight, width: 1),
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ));
  }

  static BoxDecoration selectedLeftBorder({color}) {
    color = color ?? CustomColors.primary;
    return BoxDecoration(
      border: Border(
        left: BorderSide(color: color, width: 2),
      ),
    );
  }

  static BoxDecoration unselectedLeftBorder({color}) {
    color = color ?? CustomColors.greyLight;
    return BoxDecoration(
      border: Border(
        left: BorderSide(color: color, width: 2),
      ),
    );
  }

  static BoxDecoration selectedRightBorder({color}) {
    color = color ?? CustomColors.primary;
    return BoxDecoration(
      border: Border(
        right: BorderSide(color: color, width: 2),
      ),
    );
  }

  static BoxDecoration unselectedRightBorder({color}) {
    color = color ?? CustomColors.greyLight;
    return BoxDecoration(
      border: Border(
        right: BorderSide(color: color, width: 2),
      ),
    );
  }

  static BoxDecoration homeItem() {
    return BoxDecoration(
      border: Border.all(
        color: CustomColors.primary,
      ),
      borderRadius: const BorderRadius.all(
        Radius.circular(10),
      ),
      color: const Color(0xFFE2E2E2),
    );
  }

  static BoxDecoration eventDecoration() {
    const eventBorderRadius = BorderRadius.all(Radius.circular(5));
    return const BoxDecoration(
      color: CustomColors.eventBlue,
      borderRadius: eventBorderRadius,
    );
  }

  static BoxDecoration appointmentDecoration(
      {type = Booking.other, borderRadius = 5.0}) {
    var color = CustomColors.eventOther;
    switch (type) {
      case Booking.comprehensiveExamination:
        {
          // color = CustomColors.comprehensivePink;
          // color = CustomColors.primary_light;
          color = CustomColors.comprehensivePurple;
        }
        break;
      case Booking.contactLensConsultation:
        {
          color = CustomColors.lensConsultationBlue;
        }
        break;
      case Booking.driversLicenseScreening:
        {
          color = CustomColors.licencePink;
        }
        break;
    }
    const eventBorderRadius = BorderRadius.all(Radius.circular(5));
    return BoxDecoration(
      color: color,
      borderRadius: eventBorderRadius,
    );
  }

  static BoxDecoration groupedFieldDecoration({level = 0}) {
    BoxDecoration decoration;
    switch (level) {
      case 2:
        {
          //const eventBorderRadius = BorderRadius.all(Radius.circular(5));
          decoration = const BoxDecoration(
            color: CustomColors.eventBlue,
            //borderRadius: eventBorderRadius,
          );
        }
        break;
      default:
        {
          //const eventBorderRadius = BorderRadius.all(Radius.circular(2));
          decoration = const BoxDecoration(
            color: Colors.white,
            //borderRadius: eventBorderRadius,
          );
        }
    }
    return decoration;
  }

  static BoxDecoration tableHeader({color = CustomColors.greyDark}) {
    return BoxDecoration(
      border: Border(
        bottom: BorderSide(color: color, width: 2),
      ),
    );
  }

  static BoxDecoration tableTotals({color = CustomColors.greyDark}) {
    return BoxDecoration(
      border: Border(
        bottom: BorderSide(color: color, width: 2),
        top: BorderSide(color: color, width: 2),
      ),
    );
  }

  static BoxDecoration tableRow({color = CustomColors.greyLight}) {
    return BoxDecoration(
      border: Border(
        bottom: BorderSide(color: color, width: 1),
      ),
    );
  }

  static BoxDecoration dialogContentDecoration() {
    return const BoxDecoration(
      shape: BoxShape.rectangle,
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(10)),
    );
  }

  static BoxDecoration roundedBorder({color = CustomColors.greyDark}) {
    return BoxDecoration(
      border: Border.all(
        width: 2.0,
        color: color,
      ),
      borderRadius: BorderRadius.circular(5),
    );
  }

  static BoxDecoration renderGroup() {
    return BoxDecoration(
      border: Border.all(
        color: CustomColors.grey,
        width: 1.5,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(5)),
    );
  }

  static BoxDecoration fieldSet({color, borderWidth = 2.0}) {
    color ??= CustomColors.primary;
    return BoxDecoration(
      border: Border.all(
        color: color,
        width: borderWidth,
      ),
      color: Colors.white,
      borderRadius: const BorderRadius.all(Radius.circular(5)),
    );
  }

  static BoxDecoration clinicalForm() {
    return BoxDecoration(
      border: Border.all(
        color: CustomColors.primary,
        width: 2,
      ),
      color: CustomColors.primaryLight,
      borderRadius: const BorderRadius.all(Radius.circular(5)),
    );
  }

  static BoxDecoration flatRight() {
    return const BoxDecoration(
      border: Border(
        right: BorderSide(color: CustomColors.primary, width: 1),
      ),
      color: CustomColors.primaryLight,
    );
  }

  static BoxDecoration flatLeft() {
    return const BoxDecoration(
      border: Border(
        left: BorderSide(color: CustomColors.primary, width: 1),
      ),
      color: CustomColors.primaryLight,
    );
  }
}
