import 'package:egtema3elegtema3el3am/database/getbirthday.dart';
import 'package:egtema3elegtema3el3am/utils/calendarcustomscreen.dart';
import 'package:egtema3elegtema3el3am/utils/dashboarddrawer.dart';
import 'package:egtema3elegtema3el3am/widgets/customappbar.dart';
import 'package:egtema3elegtema3el3am/widgets/customtext.dart';
import 'package:flutter/material.dart';

class Birthdaypeople extends StatefulWidget {
  const Birthdaypeople({super.key});

  @override
  State<Birthdaypeople> createState() => _BirthdaypeopleState();
}

class _BirthdaypeopleState extends State<Birthdaypeople> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE6CFA9),
      drawer: const DashDrawer(),
      appBar: const CustomAppBar(text: "أعياد الميلاد"),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: MediaQuery.orientationOf(context) == Orientation.portrait
              ? const EdgeInsets.symmetric(vertical: 30, horizontal: 20)
              : const EdgeInsets.symmetric(vertical: 15, horizontal: 60),
          child: CustomCalendar(
            dbfunction: fetchBirthdaySummary,
            nullableText: 'لا يوجد أعياد ميلاد في هذه الفترة الزمنية',
            builder: (birthdayList) => ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: birthdayList.length,
              itemBuilder: (context, index) {
                final entry = birthdayList[index].entries.first;
                final dateKey = entry.key;
                final peopleList = entry.value;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: CustomText(
                        text: dateKey,
                        isBold: true,
                        colours: 0xFF000000,
                        fontSize: 18,
                        align: TextAlign.right,
                      ),
                    ),

                    // List of people with phones
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: peopleList.length,
                      itemBuilder: (context, subIndex) {
                        final person = peopleList[subIndex];
                        final name = person.keys.first;
                        final phone = person.values.first;

                        return Card(
                          color: const Color(0xFFF6EBD1),
                          child: ListTile(
                            title: CustomText(
                              text: name,
                              isBold: true,
                              colours: 0xFF000000,
                              fontSize: 16,
                              align: TextAlign.center,
                            ),
                            subtitle: CustomText(
                              text: phone.toString(),
                              isBold: true,
                              colours: 0xFF9A3F3F,
                              fontSize: 14,
                              align: TextAlign.center,
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
