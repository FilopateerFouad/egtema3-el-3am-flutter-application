import 'package:egtema3elegtema3el3am/screens/scanqrcode.dart';
import 'package:egtema3elegtema3el3am/widgets/customtext.dart';
import 'package:flutter/material.dart';

class QRScanStart extends StatefulWidget {
  const QRScanStart({super.key});

  @override
  State<QRScanStart> createState() => _QRScanStartState();
}

class _QRScanStartState extends State<QRScanStart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: CustomText(
              text: "بدأ تسجيل الحضور",
              isBold: true,
              colours: 0xFF9A3F3F,
              fontSize: 20,
              align: TextAlign.center),
        ),
        backgroundColor: const Color(0xFFC1856D),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              text: "هل أنت متأكد من بدء تسجيل الحضور؟",
              isBold: true,
              colours: 0xFF9A3F3F,
              fontSize: 20,
              align: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const QRScan();
                }));
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFc1856d)),
              child: CustomText(
                  text: "ابدأ",
                  isBold: true,
                  colours: 0xFFFFFFFF,
                  fontSize: 15,
                  align: TextAlign.center),
            ),
          ],
        ),
      ),
    );
  }
}
