import 'package:flutter/services.dart';

class LowercaseNoSpacesFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final String newText = newValue.text.toLowerCase().replaceAll(' ', '');
    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}

String formatNumber(dynamic value) {
  if (value == "null" ||
      value == null ||
      value == 0 ||
      value == "" ||
      value == "0" ||
      value == "0.0" ||
      value == 0.0) {
    return "-";
  }

  try {
    double parsedValue = double.parse(value.toString());
    if (parsedValue == parsedValue.toInt()) {
      return parsedValue.toInt().toString();
    } else {
      return parsedValue.toString();
    }
  } catch (e) {
    return value.toString();
  }
}
