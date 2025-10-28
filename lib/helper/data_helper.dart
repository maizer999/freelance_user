
import 'package:easy_localization/easy_localization.dart';
import '../constants/app_strings.dart';



String trueFalseFunction(String? value) {
  if (value == null || value.isEmpty) {
    return AppStrings.no;
  }
  return value == "true" ? AppStrings.yes : AppStrings.no;
}

String formatNumberString(String value) {
  value = value.trim();
  double? number = double.tryParse(value);
  if (number == null) {
    return value;
  }
  if (number % 1 == 0) {
    return number.toInt().toString();
  } else {
    return number.toString().replaceAll(RegExp(r'(\.\d*?[1-9])0+$'), r'$1');
  }
}

String dateConverter(String date) {
  // Handle special cases
  if (date == '1900-01-01' || date == "9999-12-31T23:59:59") {
    return '-';
  }

  try {
    DateFormat inputFormat = DateFormat("dd-MM-yyyy HH:mm");

    final parsedDate = inputFormat.parse(date);

    final formattedDate = DateFormat("dd-MM-yyyy");
    final outputFormat = formattedDate.format(parsedDate);
    return outputFormat;
  } catch (e) {
    return '-';
  }
}

String extractFileName(String url) {
  // Split the URL by '/' to get the parts
  List<String> parts = url.split('/');
  // The file name will be the last part
  String fileName = parts.last;
  // Capitalize the first letter of each word
  String capitalizedFileName = fileName.split(' ').map((word) {
    return word.isNotEmpty
        ? '${word[0].toUpperCase()}${word.substring(1)}'
        : '';
  }).join(' ');
  return capitalizedFileName;
}

String getFileName(String fileName) {
  List<String> fileNameArr = fileName.split('.');
  String extension = "";
  String newFileName = "";
  for (int i = 0; i < fileNameArr.length; i++) {
    if (i == (fileNameArr.length - 1)) {
      extension = ".${fileNameArr[i]}";
    } else {
      newFileName += fileNameArr[i];
    }
  }
  DateTime currentDate = DateTime.now();
  int unixTimestamp = currentDate.millisecondsSinceEpoch;
  int fileNameLength =
      (newFileName + (unixTimestamp ~/ 1000).toString()).length;
  String stringWithTimestamp =
      newFileName + (unixTimestamp ~/ 1000).toString() + extension;
  if (fileNameLength > 35) {
    return "Invalid";
  } else {
    return stringWithTimestamp;
  }
}

class DropDownOption {
  final String? name;
  final String? id;
  final String? shiftId;
  DropDownOption({
    required this.name,
    required this.id,
    this.shiftId,
  });


  @override
  bool operator ==(covariant DropDownOption other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.id == id ;
  }

  @override
  int get hashCode => name.hashCode ^ id.hashCode;
  }




List<DropDownOption> yesNo = [
  DropDownOption(name: AppStrings.no, id: "0"),
  DropDownOption(name: AppStrings.yes, id: "1"),
];





String getYesNo(dynamic value) {
  if (value is bool) {
    return value ? AppStrings.yes : AppStrings.no;
  } else if (value is String) {
    switch (value.toLowerCase()) {
      case "true":
        return AppStrings.yes;
      case "false":
        return AppStrings.no;
      default:
        return "-";
    }
  } else {
    return "-";
  }
}

extension StringCasingExtension on String {
  String capitalizeFirstChar() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1).toLowerCase();
  }
}

//new formate decimal number into string
extension DynamicToString on dynamic {
  String toFormattedString() {
    if (this is int || this is double) {
      return toString().replaceFirst(RegExp(r'\.0+$'), '');
    }
    return toString();
  }
}

extension EnDigitsStringExtension on String {
  String enDigits({bool force = true}) {
    if (!force) return this;

    const eastern = ['٠','١','٢','٣','٤','٥','٦','٧','٨','٩'];
    const western = ['0','1','2','3','4','5','6','7','8','9'];
    var out = this;
    for (var i = 0; i < 10; i++) {
      out = out.replaceAll(eastern[i], western[i]);
    }
    return '\u200E$out'; // keeps LTR order
  }
}


