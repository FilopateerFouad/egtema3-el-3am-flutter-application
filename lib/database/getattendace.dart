import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

Future<List<Map<String, int>>> fetchAttendanceSummary(
  DateTime startDate,
  DateTime endDate,
) async {
  final db = FirebaseFirestore.instance.collection('attendance');
  final snapshot = await db.get();

  Map<String, int> attendanceCount = {};

  for (var doc in snapshot.docs) {
    final data = doc.data();
    final name = data['الأسم (ثلاثى وباللغة العربية)'] ?? doc.id;

    int count = 0;
    for (var entry in data.entries) {
      final key = entry.key;
      if (key.contains('-')) {
        try {
          final date = DateFormat('dd-MM-yyyy').parse(key);
          if (!date.isBefore(startDate) && !date.isAfter(endDate)) {
            count++;
          }
        } catch (_) {}
      }
    }

    if (count > 0) {
      attendanceCount[name] = count;
    }
  }
  final sortedList = attendanceCount.entries.toList()
    ..sort((a, b) => b.value.compareTo(a.value));
  return sortedList.map((e) => {e.key: e.value}).toList();
}
