import 'package:egtema3elegtema3el3am/database/getattendace.dart';
import 'package:egtema3elegtema3el3am/utils/calendarcustomscreen.dart';
import 'package:egtema3elegtema3el3am/utils/dashboarddrawer.dart';
import 'package:egtema3elegtema3el3am/utils/tableheaders.dart';
import 'package:egtema3elegtema3el3am/utils/tablerow.dart';
import 'package:egtema3elegtema3el3am/widgets/customappbar.dart';
import 'package:flutter/material.dart';

class Attendancesheet extends StatefulWidget {
  const Attendancesheet({super.key});

  @override
  State<Attendancesheet> createState() => _AttendancesheetState();
}

class _AttendancesheetState extends State<Attendancesheet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFE6CFA9),
        drawer: const DashDrawer(),
        appBar: const CustomAppBar(text: "كشف الحضور و الغياب"),
        body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
                padding: MediaQuery.orientationOf(context) ==
                        Orientation.portrait
                    ? const EdgeInsets.symmetric(vertical: 30, horizontal: 20)
                    : const EdgeInsets.symmetric(vertical: 15, horizontal: 60),
                child: CustomCalendar(
                  dbfunction: fetchAttendanceSummary,
                  nullableText: 'لا يوجد بيانات حضور في هذه الفقرة الزمنية',
                  builder: (attendanceList) => SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 20.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Table(
                          border:
                              TableBorder.all(color: const Color(0xFF9A3F3F)),
                          columnWidths: const {
                            0: FixedColumnWidth(120),
                            1: FixedColumnWidth(250),
                          },
                          children: [
                            createTableHeaders(),
                            ...createStandingRows(attendanceList),
                          ],
                        ),
                      ),
                    ),
                  ),
                ))));
  }
}
