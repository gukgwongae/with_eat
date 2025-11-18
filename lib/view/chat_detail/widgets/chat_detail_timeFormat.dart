// chat_detail_send_time_format.dart

String ChatDetailTimeFormat(DateTime date) {
  final hour = date.hour;
  final minute = date.minute;

  final isAM = hour < 12;
  final period = isAM ? '오전' : '오후';

  // 12시간제 변환 (0 → 12)
  int hour12 = hour % 12;
  if (hour12 == 0) hour12 = 12;

  final mm = minute.toString().padLeft(2, '0');

  return '$period $hour12시 $mm분';
}
