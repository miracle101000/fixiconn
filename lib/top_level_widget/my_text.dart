import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontStyle? style;
  final Color color;
  final int? maxlines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final TextDecoration? textDecoration;
  final double? letterSpacing;
  const MyText(
      {required this.text,
      required this.fontSize,
      required this.color,
      this.textDecoration,
      this.style,
      this.textAlign,
      this.overflow,
      this.fontWeight,
      this.maxlines,
      this.letterSpacing,
      super.key});

  @override
  Widget build(BuildContext context) {
    final RegExp emojiRegExp = RegExp(
        r'([\u{1F600}-\u{1F64F}]|[\u{1F300}-\u{1F5FF}]|[\u{1F680}-\u{1F6FF}]|[\u{1F700}-\u{1F77F}]|[\u{1F780}-\u{1F7FF}]|[\u{1F800}-\u{1F8FF}]|[\u{1F900}-\u{1F9FF}]|[\u{1FA00}-\u{1FA6F}]|[\u{1FA70}-\u{1FAFF}]|[\u{2600}-\u{26FF}]|[\u{2700}-\u{27BF}]|[\u{1F1E6}-\u{1F1FF}]|[\u{2000}-\u{206F}]|[\u{2B50}]|[\u{231A}]|[\u{1F004}]|[\u{25AA}-\u{25AB}])',
        unicode: true);
    final List<InlineSpan> children = [];
    text.splitMapJoin(
      emojiRegExp,
      onMatch: (match) {
        children.add(TextSpan(
            text: match.group(0),
            style: GoogleFonts.montserrat(
                fontSize: fontSize,
                fontWeight: fontWeight,
                letterSpacing: letterSpacing,
                decoration: textDecoration,
                decorationColor: color,
                color: color)));
        return match.group(0)!;
      },
      onNonMatch: (nonMatch) {
        children.add(TextSpan(
            text: nonMatch,
            style: GoogleFonts.montserrat(
                fontSize: fontSize,
                fontWeight: fontWeight,
                letterSpacing: letterSpacing,
                decoration: textDecoration,
                decorationColor: color,
                color: color,
                fontStyle: style)));
        return nonMatch;
      },
    );

    return RichText(
        maxLines: maxlines,
        textAlign: textAlign ?? TextAlign.start,
        textScaler: TextScaler.noScaling,
        overflow: overflow ?? TextOverflow.clip,
        text: TextSpan(children: children));
  }
}

class MyAutoText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final int? maxlines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final FontStyle? fontStyle;
  final FontWeight? fontWeight;
  final double? letterSpacing;
  const MyAutoText(
      {required this.text,
      required this.fontSize,
      required this.color,
      this.letterSpacing,
      this.overflow,
      this.fontStyle,
      this.fontWeight,
      this.textAlign,
      this.maxlines,
      super.key});

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      maxLines: maxlines,
      textAlign: textAlign,
      textScaleFactor: 1.0,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.montserrat(
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
          letterSpacing: letterSpacing,
          color: color),
    );
  }
}
