import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomText extends StatelessWidget {
  CustomText(
      {super.key,
      required this.text,
      required this.isBold,
      required this.colours,
      required this.fontSize,
      required this.align});
  String text;
  bool isBold;
  int colours;
  double fontSize;
  TextAlign align;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textDirection: TextDirection.rtl,
      style: TextStyle(
          fontFamily: 'ARIAL_0',
          fontWeight: isBold ? FontWeight.bold : null,
          fontSize: fontSize,
          color: Color(colours)),
      textAlign: align,
    );
  }
}
