import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final Color? color;
  final String text;
  final String? fontFamily;
  final int? maxLines;
  final TextOverflow? textOverflow;
  final double? height;
  final double? fontSize;
  final double? letterSpacing;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final TextDecoration? textDecoration;
  final double? decorThickness;
  final FontStyle? fontStyle;
  final Color? decorationColor;

  CustomText(
      {required this.text,
      this.color,
      this.fontFamily,
      this.height,
      this.maxLines,
      this.fontSize,
      this.letterSpacing,
      this.fontWeight,
      this.textAlign,
      this.textDecoration,
      this.textOverflow,
      this.decorThickness,
      this.fontStyle,
      this.decorationColor});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: maxLines == null ? null : textOverflow,
      style: TextStyle(
          color: color,
          fontFamily: fontFamily,
          fontSize: fontSize,
          height: height,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing,
          decoration: textDecoration,
          decorationThickness: decorThickness,
          decorationColor: decorationColor,
          fontStyle: fontStyle),
    );
  }
}
