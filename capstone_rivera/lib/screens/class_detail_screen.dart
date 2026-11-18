import 'package:flutter/material.dart';
import '../models/class_session.dart';

class ClassDetailScreen extends StatelessWidget {
  final ClassSession session;
  const ClassDetailScreen({super.key, required this.session});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final reminderMin = session.startMinutes - 10;
    final reminder =
        TimeOfDay(hour: (reminderMin ~/ 60) % 24, minute: reminderMin % 60);

    return Scaffold(
      appBar: AppBar(title: Text(session.code)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(session.subject, style: theme.textTheme.headlineMedium),
          const SizedBox(height: 16),
          _row(Icons.calendar_today, 'Day', dayNames[session.weekday - 1]),
          _row(Icons.schedule, 'Time',
              '${formatTime(session.start)} – ${formatTime(session.end)}'),
          _row(Icons.meeting_room, 'Room', session.room),
          _row(Icons.person, 'Teacher', session.teacher),
          _row(Icons.notifications_active, 'Reminder',
              '10 minutes before (${formatTime(reminder)})'),
        ],
      ),
    );
  }

  Widget _row(IconData icon, String label, String value) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      subtitle: Text(value),
    );
  }
}