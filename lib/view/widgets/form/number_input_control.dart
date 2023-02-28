import 'package:clinical_ui/view/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberInputControl extends StatefulWidget {
  const NumberInputControl(
      {super.key,
      required this.handler,
      this.value,
      this.minimum,
      this.maximum,
      this.stepSize = 1,
      this.precision = 0,
      this.label = '',
      this.helperText,
      this.focusNode,
      this.validator,
      this.autoValidate});

  ///[optional]
  ///Initial value,
  ///
  ///not required. defaults to 0
  final String? value;

  ///[required]
  ///Input label,
  ///
  /// describes what the input is for. defaults to ""
  final String label;

  ///[optional]
  ///Helper text to be displayed.
  ///
  ///Supplemental info for the user.
  ///Also used for validation messages
  final String? helperText;

  ///[optional]
  ///
  ///minimum value that can be entered
  final num? minimum;

  ///[optional] maximum value that can be entered
  final num? maximum;

  ///[optional]
  ///
  ///Dictates the increment/decrement amount
  ///
  ///Defaults to 1
  final num stepSize;

  ///[optional]
  ///
  ///if not provided, one will be created for the widget
  final FocusNode? focusNode;

  ///[optional]
  ///
  ///Indicates decimal floating point value. [default = 0]
  ///
  ///
  /// EG:
  ///
  /// [0] will be integer value with no decimals -> [0]
  ///
  /// [1] will be a float value with 1 decimal -> [0.0]
  ///
  /// [2] will be a float value with 2 decimal -> [0.00]
  ///
  /// etc
  final int precision;

  ///[optional]
  ///Called on form validation
  ///
  ///this widget will by default validate input against minimum and maximums if passed.
  ///
  ///Can be overridden by passing a different validator.
  final String? Function(String? value)? validator;

  ///[optional]
  ///Indicate whether or not to validate field input onChange.
  ///
  ///by default this is false
  final bool? autoValidate;

  ///[required]
  ///Callback method for parent widget to access widget value.
  final void Function(String returnValue)? handler;

  @override
  NumberInputControlState createState() => NumberInputControlState();
}

class NumberInputControlState extends State<NumberInputControl> {
  final _inputKey = GlobalKey<FormFieldState>();
  num _currentValue = 0;
  final TextEditingController _controller =
      TextEditingController(); // TODO: add as widget param
  InputState _inputState = InputState.initial;
  FocusNode? focusNode;
  String? Function(String? value)? validator;
  String? helperText;

  @override
  void initState() {
    super.initState();
    helperText = widget.helperText;
    focusNode = widget.focusNode ?? FocusNode();

    if (widget.value != null) {
      //set initial values if passed from Widget params
      _currentValue = num.parse(widget.value!);
      _controller.text = _currentValue.toStringAsFixed(widget.precision);
    }

    focusNode!.addListener(() {
      //listen to state changes for field focus
      setState(() {
        _inputState = focusNode?.hasFocus ?? false
            ? InputState.focused
            : InputState.initial;
      });
    });

    //set default validator if not passed
    validator = widget.validator ??
        (String? value) {
          if (widget.minimum != null && _currentValue < widget.minimum!) {
            return "Cannot be lower than ${widget.minimum}";
          }
          if (widget.maximum != null && _currentValue > widget.maximum!) {
            return "Cannot be higher than ${widget.maximum}";
          }
          return null;
        };
  }

  ///Increment value by stepSize
  void increment() {
    _currentValue += widget.stepSize;
    _updateValue(_currentValue);
  }

  ///Decrement value by stepSize
  void decrement() {
    _currentValue -= widget.stepSize;
    _updateValue(_currentValue);
  }

  ///updates input controller text if updated from increment/decrement buttons
  ///executes handler callback
  ///[fromOnChanged == true] indicates user typing instead of button increments,
  ///then only currentvalue is updated
  void _updateValue(dynamic value, {bool fromOnChanged = false}) {
    num? _value;

    //handle inputs starting with "." prepends 0.
    if (value is String && value != "") {
      _value = num.tryParse(value);
      if (_value == null) {
        if (value.startsWith(".")) {
          _value = num.tryParse("0.$value");
          value = _value ?? 0;
        }
      }
    }
    if (value == null) return;

    if (value is! String) {
      _value = value;
      value = value.toStringAsFixed(widget.precision);
    } else {
      _value = num.tryParse(value) ?? 0;
    }

    if (!fromOnChanged) {
      //value is string now
      _controller.text = value;
    }

    widget.handler?.call(value);

    setState(() {
      _currentValue = _value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    String regex = r'^-$|^-?\d+$'; // allow "-" as valid input
    if (widget.precision > 0) {
      // A string that contains only a hyphen (-).
      // A string that starts with an optional hyphen (-) followed by one or more digits,
      //  optionally followed by a decimal point and zero or [widget.precision] digits.
      String _precision = widget.precision.toString();
      regex = r'^[0-9]$|^-?[0-9]+(\.[0-9]{0,' +
          _precision +
          '})?|^.[0-9]{0,' +
          _precision +
          '}'; //TODO fix regex to not allow single string char.
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecorations.numberInputBox(state: _inputState),
          padding: const EdgeInsets.only(left: 2),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: TextFormField(
                  key: _inputKey,
                  autovalidateMode: widget.autoValidate ?? false
                      ? AutovalidateMode.onUserInteraction
                      : AutovalidateMode.disabled,
                  controller: _controller,
                  decoration: InputDecorations.clinicalNumberFormField(
                    labelText: widget.label,
                    textColor: _inputState.color,
                  ),
                  focusNode: focusNode,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  onChanged: (text) {
                    _updateValue(text, fromOnChanged: true);
                  },
                  validator: (String? value) {
                    String? validation = validator!(value);
                    Future.microtask(() => setState(() {
                          _inputState = validation != null
                              ? InputState.error
                              : _inputState;
                          helperText = validation ?? widget.helperText;
                        }));
                    return null;
                    //return null in order to avoid error text displaying in the Textfield itself.
                    //The widget will handle displaying the validation separately
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp(regex),
                      replacementString: widget.precision > 0
                          ? ''
                          : _currentValue.toStringAsFixed(widget.precision),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 0,
                child: Column(
                  children: [
                    IconButton(
                      onPressed: () => increment(),
                      iconSize: 25,
                      constraints:
                          const BoxConstraints(maxHeight: 25, maxWidth: 25),
                      icon: const Icon(
                        Icons.arrow_drop_up,
                        color: Colors.black,
                      ),
                      padding: EdgeInsets.zero,
                      visualDensity: VisualDensity.compact,
                      splashRadius: 10,
                    ),
                    IconButton(
                      onPressed: () => decrement(),
                      iconSize: 25,
                      constraints:
                          const BoxConstraints(maxHeight: 25, maxWidth: 25),
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                      ),
                      padding: EdgeInsets.zero,
                      visualDensity: VisualDensity.compact,
                      splashRadius: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        if (helperText != null)
          Text(
            helperText!,
            style:
                _inputState == InputState.error ? TextStyles.errorText() : null,
          ),
      ],
    );
  }
}
