import 'package:flutter/material.dart';

class ClassSession {
  final int id;
  final String code;
  final String subject;
  final String room;
  final String teacher;
  final int weekday; // DateTime.monday (1) .. DateTime.sunday (7)
  final TimeOfDay start;
  final TimeOfDay end;

  const ClassSession({
    required this.id,
    required this.code,
    required this.subject,
    required this.room,
    required this.teacher,
    required this.weekday,
    required this.start,
    required this.end,
  });

  int get startMinutes => start.hour * 60 + start.minute;
  int get endMinutes => end.hour * 60 + end.minute;
}

enum ClassStatus { done, ongoing, upcoming }

ClassStatus statusOf(ClassSession s, DateTime now) {
  final m = now.hour * 60 + now.minute;
  if (m >= s.endMinutes) return ClassStatus.done;
  if (m >= s.startMinutes) return ClassStatus.ongoing;
  return ClassStatus.upcoming;
}

const dayNames = [
  'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'
];

String formatTime(TimeOfDay t) {
  final h = t.hourOfPeriod == 0 ? 12 : t.hourOfPeriod;
  final m = t.minute.toString().padLeft(2, '0');
  final p = t.period == DayPeriod.am ? 'AM' : 'PM';
  return '$h:$m $p';
}