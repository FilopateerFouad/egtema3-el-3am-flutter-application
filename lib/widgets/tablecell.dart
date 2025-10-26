import 'package:egtema3elegtema3el3am/widgets/customtext.dart';
import 'package:flutter/material.dart';

TableCell createTableCell(String text, [bool isHeader = false]) {
  return TableCell(
    child: Container(
      color: isHeader ? const Color(0xFFC1856D) : const Color(0xFFE6CFA9),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
          child: CustomText(
            text: text,
            colours: isHeader ? 0xFFFFFFFF : 0xFF000000,
            fontSize: 18,
            isBold: isHeader,
            align: TextAlign.center,
          )),
    ),
  );
}
