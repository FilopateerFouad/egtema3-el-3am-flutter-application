
import 'package:egtema3elegtema3el3am/screens/attendancesheet.dart';
import 'package:egtema3elegtema3el3am/screens/startscanqrcode.dart';
import 'package:egtema3elegtema3el3am/widgets/customlisttile.dart';
import 'package:egtema3elegtema3el3am/widgets/customtext.dart';
import 'package:flutter/material.dart';

class DashDrawer extends StatefulWidget {
  const DashDrawer({super.key});

  @override
  State<DashDrawer> createState() => _DashDrawerState();
}

class _DashDrawerState extends State<DashDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF9A3F3F),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Color(0xFFC1856D)),
            child: Center(
                child: CustomText(
                    text: "القائمةالرئيسية",
                    isBold: true,
                    colours: 0xFF9A3F3F,
                    fontSize: 25,
                    align: TextAlign.center)),
          ),
          CustomListTile(
              colours: 0xFFFBF9D1,
              suffix: const Icon(Icons.assignment_turned_in_sharp),
              text: "تسجيل الحضور",
              tapped: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (cp) {
                  return const QRScanStart();
                }));
              }),
          CustomListTile(
              colours: 0xFFFBF9D1,
              suffix: const Icon(Icons.book),
              text: "كشف الحضور و الغياب",
              tapped: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (cp) {
                  return const Attendancesheet();
                }));
              }),
          CustomListTile(
              colours: 0xFFFBF9D1,
              suffix: const Icon(Icons.cake),
              text: "أعياد الميلاد",
              tapped: () {}),
          CustomListTile(
              colours: 0xFFFBF9D1,
              suffix: const Icon(Icons.people),
              text: "تعديل البيانات",
              tapped: () {}),
        ],
      ),
    );
  }
}
