import 'package:flutter/material.dart';
import '../data/seed_data.dart';
import '../models/class_session.dart';
import '../widgets/empty_state.dart';
import '../widgets/next_class_banner.dart';
import '../widgets/session_card.dart';

class TodayScreen extends StatelessWidget {
  final DateTime now;
  const TodayScreen({super.key, required this.now});

  @override
  Widget build(BuildContext context) {
    final today = sessionsFor(now.weekday);
    final theme = Theme.of(context);
    final remaining =
        today.where((s) => statusOf(s, now) != ClassStatus.done).toList();
    final next = remaining.isEmpty ? null : remaining.first;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(dayNames[now.weekday - 1], style: theme.textTheme.headlineMedium),
        Text(
          '${today.length} class${today.length == 1 ? '' : 'es'} today',
          style: theme.textTheme.bodyLarge
              ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
        ),
        const SizedBox(height: 16),
        if (today.isEmpty)
          const EmptyState()
        else ...[
          if (next != null) NextClassBanner(session: next, now: now),
          const SizedBox(height: 8),
          for (final s in today) SessionCard(session: s, now: now),
        ],
      ],
    );
  }
}