import 'dart:convert';
import 'dart:developer';

import 'package:fitpage/utils/utils.dart';
import 'package:flutter/material.dart';

class PrintUtils {
  static printJson(dynamic json) => log(convertToJsonString(json));

  static String convertToJsonString(Object text) {
    try {
      if (text is String && text.contains("{")) {
        text = jsonDecode(text);
      }
      if (text is Map) {
        JsonEncoder encoder = new JsonEncoder.withIndent('  ');
        return encoder.convert(text);
      }
    } catch (exception, stackTrace) {
      Utils.captureException(exception, stackTrace);
    }
    return "";
  }

  static printColorText(String text, PrintColor color,
      {bool? isException,
      PrintFontStyle? printFontStyle,
      PrintColor? backgroundTextColor}) {
    String colorString = "", bgnColorString = "", styleString = "";
    colorString = "\x1B[${_colorValue[color]!}m";
    if (backgroundTextColor != null) {
      bgnColorString = "\x1B[${_colorValue[backgroundTextColor]! + 10}m";
    }
    if (printFontStyle != null) {
      styleString = "\x1B[${_fontStyle[printFontStyle]!}m";
    }
    String resetString = "\x1B[0m";
    debugPrint("$bgnColorString$colorString$styleString$text$resetString");
  }
}

enum PrintColor { Black, Red, Green, Yellow, Blue, Magenta, Cyan, White }

enum PrintFontStyle {
  Bold,
  Faint,
  Italic,
  Underlined,
  Inverse,
  Strikethrough,
}

Map<PrintColor, int> _colorValue = {
  PrintColor.Black: 30,
  PrintColor.Red: 31,
  PrintColor.Green: 32,
  PrintColor.Yellow: 33,
  PrintColor.Blue: 34,
  PrintColor.Magenta: 35,
  PrintColor.Cyan: 36,
  PrintColor.White: 37,
};

Map<PrintFontStyle, int> _fontStyle = {
  PrintFontStyle.Bold: 1,
  PrintFontStyle.Faint: 2,
  PrintFontStyle.Italic: 3,
  PrintFontStyle.Underlined: 4,
  PrintFontStyle.Inverse: 7,
  PrintFontStyle.Strikethrough: 9,
};
