import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomListTile extends StatelessWidget {
  CustomListTile(
      {super.key,
      required this.colours,
      required this.text,
      required this.suffix,
      required this.tapped});
  int colours;
  Widget suffix;
  String text;
  void Function()? tapped;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: tapped,
      trailing: suffix,
      leading: Text(text,
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'ARIAL_0',
              fontSize:
                  MediaQuery.orientationOf(context) == Orientation.portrait
                      ? MediaQuery.sizeOf(context).width * 0.04
                      : MediaQuery.sizeOf(context).width * 0.02,
              color: Color(colours))),
    );
  }
}
