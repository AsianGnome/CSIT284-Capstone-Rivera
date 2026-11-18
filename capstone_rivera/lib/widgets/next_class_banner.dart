import 'package:flutter/material.dart';
import '../models/class_session.dart';

class NextClassBanner extends StatelessWidget {
  final ClassSession session;
  final DateTime now;
  const NextClassBanner({super.key, required this.session, required this.now});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final ongoing = statusOf(session, now) == ClassStatus.ongoing;
    final minsLeft = session.startMinutes - (now.hour * 60 + now.minute);

    String label;
    if (ongoing) {
      label = 'Happening now';
    } else if (minsLeft < 60) {
      label = 'Next class in $minsLeft min';
    } else {
      label = 'Next class at ${formatTime(session.start)}';
    }

    return Card(
      color: scheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label,
                style: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(color: scheme.onPrimaryContainer)),
            const SizedBox(height: 4),
            Text(session.subject,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: scheme.onPrimaryContainer,
                    fontWeight: FontWeight.bold)),
            Text('${session.room} • ${session.teacher}',
                style: TextStyle(color: scheme.onPrimaryContainer)),
          ],
        ),
      ),
    );
  }
}