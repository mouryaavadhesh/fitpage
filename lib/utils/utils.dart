import 'dart:async';

import 'package:fitpage/utils/print_utils.dart';
import 'package:flutter/material.dart';

class Utils {
  static Future<void> captureException(
      Object exception, StackTrace stackTrace) async {
    PrintUtils.printColorText(
        'Logging Exception: $exception====>$stackTrace', PrintColor.Red,
        isException: true);
  }

  static normalPrint(String value) {
    PrintUtils.printColorText('-----Start-------', PrintColor.Yellow);
    PrintUtils.printColorText(value, PrintColor.Black);
    PrintUtils.printColorText('-----End-------', PrintColor.Cyan);
  }

  static  Color convertColorTextToColor(String colorText) {
    switch (colorText.toLowerCase()) {
      case 'red':
        return Colors.red;
      case 'green':
        return Colors.greenAccent;
      case 'blue':
        return Colors.blue;
      default:
        return Colors.black;
    }
  }

  static  List<String> extractStringsAssociatedWithDollarSign(String input) {
    RegExp regex = RegExp(r'\$\d+');
    List<String> extractedStrings = [];

    regex.allMatches(input).forEach((match) {
      extractedStrings.add(match.group(0)!);
    });

    return extractedStrings;
  }
}
