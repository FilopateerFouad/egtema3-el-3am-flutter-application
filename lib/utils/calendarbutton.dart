import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:egtema3elegtema3el3am/widgets/customtext.dart';
import 'package:flutter/material.dart';

class Calendarpicker extends StatefulWidget {
  final Function(List<DateTime?>) onDateRangeSelected;
  const Calendarpicker({super.key, required this.onDateRangeSelected});

  @override
  State<Calendarpicker> createState() => _CalendarpickerState();
}

class _CalendarpickerState extends State<Calendarpicker> {
  Future<void> _selectDateRange() async {
     List<DateTime?> rangeDateValue = []; 
    final values = await showCalendarDatePicker2Dialog(
      context: context,
      config: CalendarDatePicker2WithActionButtonsConfig(
        calendarType: CalendarDatePicker2Type.range,
        selectedDayHighlightColor: const Color(0xFF9A3F3F),
      ),
      dialogSize: const Size(325, 400),
      value: rangeDateValue,
    );
    if (values != null &&
        values.length == 2 &&
        values[0] != null &&
        values[1] != null) {
      setState(() {
         widget.onDateRangeSelected(values);
      });
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _selectDateRange,
      style: ElevatedButton.styleFrom(
        alignment: Alignment.center,
        backgroundColor: const Color(0xFFC1856D),
      ),
      child: CustomText(
          text: "اختر المدة الزمنية",
          isBold: true,
          colours: 0xFFFFFFFF,
          fontSize: 20,
          align: TextAlign.center),
    );
  }
}
