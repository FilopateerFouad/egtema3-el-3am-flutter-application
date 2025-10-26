import 'package:egtema3elegtema3el3am/utils/calendarbutton.dart';
import 'package:egtema3elegtema3el3am/widgets/customtext.dart';
import 'package:flutter/material.dart';

class CustomCalendar extends StatefulWidget {
  final Future<List<Map<String, dynamic>>> Function(DateTime, DateTime) dbfunction;
 final Widget Function(List<Map<String, dynamic>>) builder;
  final String nullableText;
  const CustomCalendar({super.key, required this.dbfunction, required this.builder, required this.nullableText });

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  List<DateTime?> rangeDateValue = [];
  List<Map<String, dynamic>> dbList = [];
  bool isLoading = false;
  void rangeselected(List<DateTime?> range) async {
    setState(() {
      rangeDateValue = range;
    });
    if (range.length == 2 && range[0] != null && range[1] != null) {
      setState(() => isLoading = true);
      final result = await widget.dbfunction(range[0]!, range[1]!);
      setState(() {
        dbList = result;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final start = rangeDateValue.isNotEmpty ? rangeDateValue[0] : null;
    final end = rangeDateValue.length > 1 ? rangeDateValue[1] : null;
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Calendarpicker(
            onDateRangeSelected: rangeselected,
          ),
          const SizedBox(height: 10),
          if (start != null && end != null)
            CustomText(
                text:
                    "من ${start.toString().split(' ')[0]} إلى ${end.toString().split(' ')[0]}",
                isBold: true,
                colours: 0xFF000000,
                fontSize: 20,
                align: TextAlign.center),
          const SizedBox(height: 20),
          if (isLoading) const Center(child: CircularProgressIndicator()),
          if (dbList.isNotEmpty)
            widget.builder(dbList)
          else
            Center(
                child: CustomText(
                    text: widget.nullableText,
                    isBold: true,
                    colours: 0xFF000000,
                    fontSize: 16,
                    align: TextAlign.center)),
        ]);
  }
}
