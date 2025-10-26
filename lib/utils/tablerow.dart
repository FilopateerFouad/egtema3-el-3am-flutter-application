import 'package:egtema3elegtema3el3am/widgets/tablecell.dart';
import 'package:flutter/material.dart';

List<TableRow> createStandingRows(List<Map<String, dynamic>> attendanceList) {
  return attendanceList.map((attendance) {
    return TableRow(
      children: [
        createTableCell(attendance.values.toString()),
        createTableCell(attendance.keys.first.toString()),
      ],
    );
  }).toList();
}
