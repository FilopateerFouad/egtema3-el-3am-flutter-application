import 'package:egtema3elegtema3el3am/widgets/tablecell.dart';
import 'package:flutter/material.dart';

TableRow createTableHeaders() {
  return TableRow(
    children: [
      createTableCell('عدد الحضور', true),
      createTableCell('الاسم', true),
    ],
  );
}
