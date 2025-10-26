import 'dart:async';
import 'package:egtema3elegtema3el3am/database/saveattendance.dart';
import 'package:egtema3elegtema3el3am/screens/dashboard.dart';
import 'package:egtema3elegtema3el3am/utils/attendancealertdialouge.dart';
import 'package:egtema3elegtema3el3am/widgets/customtext.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRScan extends StatefulWidget {
  const QRScan({super.key});

  @override
  State<QRScan> createState() => _QRScanState();
}

class _QRScanState extends State<QRScan> {
  String? scannedCode;
  bool isVisible = false;
  bool isfinished = false;
  bool canScan = true;
  List<String> scannedCodes = [];
  MobileScannerController controller = MobileScannerController();

  Future<void> _handleScan(String code) async {
    controller.stop();
    setState(() {
      scannedCode = code;
      isVisible = true;
      canScan = false;
    });

    await showDialog(
      context: context,
      builder: (context) => Attendancealertdialouge(
        text: code,
        onOkPressed: () {
          if (!scannedCodes.contains(code)) {
            scannedCodes.add(code);
          }
          Navigator.of(context).pop();
        },
        onNoPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );

    // Wait 3 seconds before next scan
    await Future.delayed(const Duration(seconds: 3));

    if (mounted) {
      setState(() {
        isVisible = false;
        canScan = true;
      });
      controller.start();
    }
  }

  Future<void> _confirmExit(BuildContext context) async {
    controller.stop();
    final bool? confirmExit = await showDialog<bool>(
      context: context,
      builder: (context) => Attendancealertdialouge(
        text: "هل أنت متأكد من انهاء تسجيل الحضور؟",
        onOkPressed: () async {
          Navigator.of(context).pop(true);
        },
        onNoPressed: () {
          Navigator.of(context).pop(false);
          controller.start();
        },
      ),
    );

    if (confirmExit == true) {
      await saveAttendance(scannedCodes);
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const Dashboard()),
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: CustomText(
              text: "attendance saved successfully!",
              isBold: true,
              colours: 0xFFFFFFFF,
              fontSize: 20,
              align: TextAlign.center,
            ),
            backgroundColor: const Color(0xFF4BB543),
            duration: const Duration(seconds: 3),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) async {
        if (!didPop) {
          await _confirmExit(context);
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFE6CFA9),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.orientationOf(context) == Orientation.portrait
                    ? MediaQuery.sizeOf(context).width * 0.6
                    : MediaQuery.sizeOf(context).width * 0.3,
                height:
                    MediaQuery.orientationOf(context) == Orientation.portrait
                        ? MediaQuery.sizeOf(context).width * 0.5
                        : MediaQuery.sizeOf(context).width * 0.25,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFF9A3F3F),
                    width: 5,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: MobileScanner(
                  controller: controller,
                  fit: BoxFit.cover,
                  onDetect: (result) {
                    final barcode = result.barcodes.first;
                    final String? code = barcode.rawValue;
                    if (code != null && !isVisible && canScan) {
                      _handleScan(code);
                    }
                  },
                ),
              ),
              const SizedBox(height: 60),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFC1856D),
                ),
                onPressed: () async {
                  await _confirmExit(context);
                },
                child: CustomText(
                  text: "انهاء التسجيل",
                  isBold: true,
                  colours: 0xFF9A3F3F,
                  fontSize: 35,
                  align: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
