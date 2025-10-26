import 'package:egtema3elegtema3el3am/widgets/customtext.dart';
import 'package:flutter/material.dart';

class Attendancealertdialouge extends StatefulWidget {
  final String? text;
  final Function()? onOkPressed;
  final Function()? onNoPressed;
  const Attendancealertdialouge(
      {super.key, required this.text, this.onOkPressed, this.onNoPressed});

  @override
  State<Attendancealertdialouge> createState() =>
      _AttendancealertdialougeState();
}

class _AttendancealertdialougeState extends State<Attendancealertdialouge> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: CustomText(
          text: widget.text.toString(),
          isBold: true,
          colours: 0xFF9A3F3F,
          fontSize: 16,
          align: TextAlign.center),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              onPressed: () {
                if (widget.onNoPressed != null) {
                  widget.onNoPressed!();
                }
              },
              child: CustomText(
                  text: "No",
                  isBold: true,
                  colours: 0xFF9A3F3F,
                  fontSize: 16,
                  align: TextAlign.center),
            ),
            TextButton(
              onPressed: () {
                if (widget.onOkPressed != null) {
                  widget.onOkPressed!();
                }
              },
              child: CustomText(
                  text: "Yes",
                  isBold: true,
                  colours: 0xFF9A3F3F,
                  fontSize: 16,
                  align: TextAlign.center),
            )
          ],
        ),
      ],
    );
  }
}
