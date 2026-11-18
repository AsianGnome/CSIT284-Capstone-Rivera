import 'package:flutter/material.dart';
import '../data/seed_data.dart';
import '../models/class_session.dart';
import '../widgets/empty_state.dart';
import '../widgets/session_card.dart';

class WeeklyScreen extends StatelessWidget {
  final DateTime now;
  const WeeklyScreen({super.key, required this.now});

  @override
  Widget build(BuildContext context) {
    final initial = (now.weekday - 1).clamp(0, 5); // Sunday -> Monday
    return DefaultTabController(
      length: 6,
      initialIndex: initial,
      child: Column(
        children: [
          TabBar(
            tabs: [
              for (var i = 0; i < 6; i++) Tab(text: dayNames[i].substring(0, 3)),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                for (var d = 1; d <= 6; d++) _DayList(weekday: d, now: now),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DayList extends StatelessWidget {
  final int weekday;
  final DateTime now;
  const _DayList({required this.weekday, required this.now});

  @override
  Widget build(BuildContext context) {
    final list = sessionsFor(weekday);
    if (list.isEmpty) {
      return const EmptyState(message: 'No classes');
    }
    final isToday = weekday == now.weekday;
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        for (final s in list)
          SessionCard(session: s, now: now, showStatus: isToday),
      ],
    );
  }
}