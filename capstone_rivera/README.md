# Class Schedule / Timetable Viewer

**Course:** CSIT284 Capstone
**Project:** X7 – Class Schedule / Timetable Viewer
**Name:** Rivera Zaldy Kid D.
**Workstation Number:** WS37

## Project Description
A Flutter mobile app that lets a student view one section's class schedule.
It has a **Today** home screen showing today's classes (with a "next class"
banner), a **Weekly** timetable with a tab for each day, and a **class detail**
screen. A reminder notification 10 minutes before each class is planned
(see Status).

## Features
- Today's classes home screen with next-class banner and Now / Done status
- Weekly timetable (Mon–Sat tabs)
- Tap a class to open its detail screen
- 12 dummy classes loaded from seed data (no login, no editing UI)
- Reminder toggle in the app bar

## Scope (cut on purpose)
One section only • no editing UI • no authentication • hardcoded seed data

## Project Structure
```
lib/
├── main.dart
├── models/    class_session.dart
├── screens/   home_shell, today_screen, weekly_screen, class_detail_screen
├── widgets/   session_card, next_class_banner, empty_state
├── data/      seed_data.dart
└── services/  notification_service.dart
```