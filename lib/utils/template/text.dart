import 'package:fitpage/utils/widget/custom_text.dart';
import 'package:flutter/material.dart';

class StockText {
  static Widget text(String text, double size, Color color, String font,
      {int maxLines = 1}) {
    return CustomText(
      text: text,
      color: color,
      fontFamily: font,
      fontSize: size,
      maxLines: maxLines,
      textOverflow: TextOverflow.ellipsis,
    );
  }

  static CustomText textInterRegular(
      {required String text,
      required int fontSize,
      Color color = Colors.black,
      int maxLines = 1,
      TextOverflow textOverFlow = TextOverflow.ellipsis,
      TextAlign textAlign = TextAlign.start,
      FontStyle fontStyle = FontStyle.normal,
      TextDecoration textDecoration = TextDecoration.none}) {
    return CustomText(
      color: color,
      text: text,
      maxLines: maxLines,
      fontWeight: FontWeight.w400,
      textOverflow: textOverFlow,
      fontSize: fontSize.toDouble(),
      textAlign: textAlign,
      textDecoration: textDecoration,
      fontStyle: fontStyle,
    );
  }

  static CustomText textSemiBold(
      {required String text,
      required int fontSize,
      Color color = Colors.black,
      int maxLines = 1,
      TextOverflow textOverFlow = TextOverflow.ellipsis,
      TextAlign textAlign = TextAlign.start,
      TextDecoration textDecoration = TextDecoration.none,
      double letterSpacing = 0}) {
    return CustomText(
      color: color,
      text: text,
      maxLines: maxLines,
      textOverflow: textOverFlow,
      fontSize: fontSize.toDouble(),
      textAlign: textAlign,
      fontWeight: FontWeight.w600,
      textDecoration: textDecoration,
      letterSpacing: letterSpacing,
      fontStyle: FontStyle.normal,
    );
  }

  static CustomText textMedium(
      {required String text,
      required int fontSize,
      Color color = Colors.black,
      int maxLines = 1,
      TextOverflow textOverFlow = TextOverflow.ellipsis,
      TextAlign textAlign = TextAlign.start,
      FontStyle fontStyle = FontStyle.normal,
      TextDecoration textDecoration = TextDecoration.none,
      Color? decorationColor}) {
    return CustomText(
      color: color,
      text: text,
      maxLines: maxLines,
      textOverflow: textOverFlow,
      fontSize: fontSize.toDouble(),
      textAlign: textAlign,
      fontWeight: FontWeight.w500,
      textDecoration: textDecoration,
      fontStyle: fontStyle,
      decorationColor: decorationColor ?? color,
    );
  }

  static CustomText textBold(
      {required String text,
      required int fontSize,
      Color color = Colors.black,
      int maxLines = 1,
      TextOverflow textOverFlow = TextOverflow.ellipsis,
      TextAlign textAlign = TextAlign.start,
      TextDecoration textDecoration = TextDecoration.none}) {
    return CustomText(
      color: color,
      text: text,
      maxLines: maxLines,
      textOverflow: textOverFlow,
      fontSize: fontSize.toDouble(),
      fontWeight: FontWeight.w700,
      textAlign: textAlign,
      textDecoration: textDecoration,
      fontStyle: FontStyle.normal,
    );
  }
}
