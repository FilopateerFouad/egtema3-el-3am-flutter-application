
import 'package:egtema3elegtema3el3am/screens/attendancesheet.dart';
import 'package:egtema3elegtema3el3am/screens/birthdaypeople.dart';
import 'package:egtema3elegtema3el3am/screens/startscanqrcode.dart';
import 'package:egtema3elegtema3el3am/utils/dashboarddrawer.dart';
import 'package:egtema3elegtema3el3am/widgets/customappbar.dart';
import 'package:egtema3elegtema3el3am/widgets/customcard.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFE6CFA9),
        drawer: const DashDrawer(),
        appBar:  const CustomAppBar(text: "الاجتماع العام"),
        body: Padding(
          padding: MediaQuery.orientationOf(context) == Orientation.portrait
              ? const EdgeInsets.symmetric(vertical: 30, horizontal: 20)
              : const EdgeInsets.symmetric(vertical: 15, horizontal: 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomCard(
                colours: 0xFFFBF9D1,
                textcolours: 0xFF9A3F3F,
                text: "تسجيل الحضور",
                suffix: const Icon(Icons.assignment_turned_in_sharp),
                tapped: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (cp) {
                    return const QRScanStart();
                  }));
                },
              ),
              CustomCard(
                colours: 0xFFFBF9D1,
                textcolours: 0xFF9A3F3F,
                text: "كشف الحضور و الغياب",
                suffix: const Icon(Icons.book),
                tapped: () {
                   Navigator.of(context).push(MaterialPageRoute(builder: (cp) {
                    return const Attendancesheet();
                  }));
                },
              ),
              CustomCard(
                colours: 0xFFFBF9D1,
                textcolours: 0xFF9A3F3F,
                text: "أعياد الميلاد",
                suffix: const Icon(Icons.cake),
                tapped: () {
                     Navigator.of(context).push(MaterialPageRoute(builder: (cp) {
                    return const Birthdaypeople();
                  }));
                }, 
              ),
              CustomCard(
                colours: 0xFFFBF9D1,
                textcolours: 0xFF9A3F3F,
                text: "تعديل البيانات",
                suffix: const Icon(Icons.people),
                tapped: () {},
              ),
            ],
          ),
        ));
  }
}
