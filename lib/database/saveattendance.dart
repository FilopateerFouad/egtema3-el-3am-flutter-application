import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart' show DateFormat;

Future<void> saveAttendance(List<String> scannedCodes) async {
  final String today = DateFormat('dd-MM-yyyy').format(DateTime.now());
  WriteBatch batch = FirebaseFirestore.instance.batch();
  for (String code in scannedCodes) {
    DocumentReference docRef =
        FirebaseFirestore.instance.collection('attendance').doc(code);
    batch.set(
      docRef,
      {
        'الأسم (ثلاثى وباللغة العربية)': code,
        today: 'Yes',
      },
      SetOptions(merge: true),
    );
  }
  await batch.commit();
}
