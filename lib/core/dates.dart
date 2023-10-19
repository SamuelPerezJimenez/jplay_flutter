import 'package:intl/intl.dart';

String formatDate(DateTime date) {
  final now = DateTime.now();
  if (date.day == now.day) return "Today";
  if (date.day == now.add(const Duration(days: 1)).day) return "Tomorrow";
  return DateFormat('EEEE, MMM. d').format(date);
}
