import 'dart:async';
import 'package:flutter/material.dart';
import '../data/seed_data.dart';
import '../services/notification_service.dart';
import 'today_screen.dart';
import 'weekly_screen.dart';

class HomeShell extends StatefulWidget {
  const HomeShell({super.key});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int _tab = 0;
  bool _remindersOn = true;
  late DateTime _now;
  Timer? _ticker;

  @override
  void initState() {
    super.initState();
    _now = DateTime.now();
    _ticker = Timer.periodic(const Duration(minutes: 1), (_) {
      setState(() => _now = DateTime.now());
    });
  }

  @override
  void dispose() {
    _ticker?.cancel();
    super.dispose();
  }

  Future<void> _toggleReminders() async {
    final turnOn = !_remindersOn;
    setState(() => _remindersOn = turnOn);
    if (turnOn) {
      await NotificationService.scheduleAll(seedSchedule);
    } else {
      await NotificationService.cancelAll();
    }
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
          turnOn ? 'Reminders on (10 min before class)' : 'Reminders off'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tab == 0 ? 'Today' : 'Weekly Timetable'),
        actions: [
          IconButton(
            tooltip: 'Toggle reminders',
            icon: Icon(_remindersOn
                ? Icons.notifications_active
                : Icons.notifications_off_outlined),
            onPressed: _toggleReminders,
          ),
        ],
      ),
      body: _tab == 0 ? TodayScreen(now: _now) : WeeklyScreen(now: _now),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _tab,
        onDestinationSelected: (i) => setState(() => _tab = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.today), label: 'Today'),
          NavigationDestination(
              icon: Icon(Icons.calendar_view_week), label: 'Week'),
        ],
      ),
    );
  }
}