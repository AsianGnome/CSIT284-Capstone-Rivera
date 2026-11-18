import 'package:flutter/material.dart';
import '../models/class_session.dart';

// Dummy data: one section's schedule, hardcoded (no editing UI).
const List<ClassSession> seedSchedule = [
  // Monday
  ClassSession(id: 1, code: 'CSIT284', subject: 'Capstone Project', room: 'Lab 3',
      teacher: 'Mr. Reyes', weekday: DateTime.monday,
      start: TimeOfDay(hour: 8, minute: 0), end: TimeOfDay(hour: 10, minute: 0)),
  ClassSession(id: 2, code: 'CSIT221', subject: 'Data Structures', room: 'Rm 204',
      teacher: 'Ms. Santos', weekday: DateTime.monday,
      start: TimeOfDay(hour: 10, minute: 30), end: TimeOfDay(hour: 12, minute: 0)),
  // Tuesday
  ClassSession(id: 3, code: 'CSIT231', subject: 'Database Systems', room: 'Lab 1',
      teacher: 'Mr. Cruz', weekday: DateTime.tuesday,
      start: TimeOfDay(hour: 9, minute: 0), end: TimeOfDay(hour: 11, minute: 0)),
  ClassSession(id: 4, code: 'GE102', subject: 'Ethics', room: 'Rm 110',
      teacher: 'Dr. Lim', weekday: DateTime.tuesday,
      start: TimeOfDay(hour: 13, minute: 0), end: TimeOfDay(hour: 14, minute: 30)),
  // Wednesday
  ClassSession(id: 5, code: 'CSIT284', subject: 'Capstone Project', room: 'Lab 3',
      teacher: 'Mr. Reyes', weekday: DateTime.wednesday,
      start: TimeOfDay(hour: 8, minute: 0), end: TimeOfDay(hour: 10, minute: 0)),
  ClassSession(id: 6, code: 'CSIT221', subject: 'Data Structures', room: 'Rm 204',
      teacher: 'Ms. Santos', weekday: DateTime.wednesday,
      start: TimeOfDay(hour: 10, minute: 30), end: TimeOfDay(hour: 12, minute: 0)),
  ClassSession(id: 7, code: 'GE105', subject: 'Physical Education', room: 'Gym',
      teacher: 'Coach Ramos', weekday: DateTime.wednesday,
      start: TimeOfDay(hour: 14, minute: 0), end: TimeOfDay(hour: 16, minute: 0)),
  // Thursday
  ClassSession(id: 8, code: 'CSIT231', subject: 'Database Systems', room: 'Lab 1',
      teacher: 'Mr. Cruz', weekday: DateTime.thursday,
      start: TimeOfDay(hour: 9, minute: 0), end: TimeOfDay(hour: 11, minute: 0)),
  ClassSession(id: 9, code: 'CSIT241', subject: 'Mobile Development', room: 'Lab 2',
      teacher: 'Ms. Garcia', weekday: DateTime.thursday,
      start: TimeOfDay(hour: 13, minute: 0), end: TimeOfDay(hour: 16, minute: 0)),
  // Friday
  ClassSession(id: 10, code: 'GE102', subject: 'Ethics', room: 'Rm 110',
      teacher: 'Dr. Lim', weekday: DateTime.friday,
      start: TimeOfDay(hour: 8, minute: 0), end: TimeOfDay(hour: 9, minute: 30)),
  ClassSession(id: 11, code: 'CSIT241', subject: 'Mobile Development', room: 'Lab 2',
      teacher: 'Ms. Garcia', weekday: DateTime.friday,
      start: TimeOfDay(hour: 10, minute: 0), end: TimeOfDay(hour: 12, minute: 0)),
  ClassSession(id: 12, code: 'CSIT251', subject: 'Web Systems', room: 'Lab 4',
      teacher: 'Mr. Dela Cruz', weekday: DateTime.friday,
      start: TimeOfDay(hour: 13, minute: 0), end: TimeOfDay(hour: 15, minute: 0)),
];

List<ClassSession> sessionsFor(int weekday) {
  final list = seedSchedule.where((s) => s.weekday == weekday).toList()
    ..sort((a, b) => a.startMinutes.compareTo(b.startMinutes));
  return list;
}