import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

Future<List<Map<String, List<Map<String, int>>>>> fetchBirthdaySummary(
  DateTime startDate,
  DateTime endDate,
) async {
  final db = FirebaseFirestore.instance.collection('spreadsheet_data');
  final snapshot = await db.get();

  final groupedBirthdays = <String, List<Map<String, int>>>{};
  final inputFormat = DateFormat('MM/dd/yyyy'); // your date format

  for (var doc in snapshot.docs) {
    final data = doc.data();

    final rawDate = data['تاريخ الميلاد'];
    final name = data['الأسم (ثلاثى وباللغة العربية)'];
    final phoneRaw = data['التليفون المحمول / به واتساب'];

    if (rawDate == null || name == null || phoneRaw == null) continue;

    try {
      final birthday = inputFormat.parse(rawDate.toString());
      // birthday in the current year
      final birthdayThisYear =
          DateTime(startDate.year, birthday.month, birthday.day);

      // Check only month/day range (same year)
      if (!birthdayThisYear.isBefore(startDate) &&
          !birthdayThisYear.isAfter(endDate)) {
        final dayName = DateFormat('EEEE').format(birthdayThisYear);
        final dateKey =
            "${DateFormat('MM-dd').format(birthdayThisYear)} ($dayName)";

        final phone = int.tryParse(phoneRaw.toString()) ?? 0;

        groupedBirthdays.putIfAbsent(dateKey, () => []);
        groupedBirthdays[dateKey]!.add({name.toString(): phone});
      }
    } catch (e) {
      print('Failed to parse date: $rawDate → $e');
    }
  }

  // Sort by date key
  final sorted = groupedBirthdays.entries.toList()
    ..sort((a, b) => a.key.compareTo(b.key));

  return sorted.map((e) => {e.key: e.value}).toList();
}
