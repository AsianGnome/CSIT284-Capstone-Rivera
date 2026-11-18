import 'package:flutter/material.dart';
import '../models/class_session.dart';
import '../screens/class_detail_screen.dart';

class SessionCard extends StatelessWidget {
  final ClassSession session;
  final DateTime now;
  final bool showStatus;

  const SessionCard({
    super.key,
    required this.session,
    required this.now,
    this.showStatus = true,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final status = showStatus ? statusOf(session, now) : ClassStatus.upcoming;

    return Opacity(
      opacity: status == ClassStatus.done ? 0.5 : 1,
      child: Card(
        margin: const EdgeInsets.only(bottom: 12),
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          // Navigation: tap a class to open its detail screen.
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ClassDetailScreen(session: session),
            ),
          ),
          leading: SizedBox(
            width: 72,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(formatTime(session.start),
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(formatTime(session.end),
                    style: TextStyle(color: scheme.onSurfaceVariant)),
              ],
            ),
          ),
          title: Text('${session.code} • ${session.subject}'),
          subtitle: Text('${session.room} • ${session.teacher}'),
          trailing: switch (status) {
            ClassStatus.ongoing => Chip(
                label: const Text('Now'),
                backgroundColor: scheme.tertiaryContainer),
            ClassStatus.done => const Icon(Icons.check_circle_outline),
            ClassStatus.upcoming => const Icon(Icons.chevron_right),
          },
        ),
      ),
    );
  }
}