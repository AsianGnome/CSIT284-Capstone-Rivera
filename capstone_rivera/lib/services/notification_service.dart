/// TEMPORARY no-op version so the app runs on a PC without Developer Mode.
/// The real implementation (flutter_local_notifications) is saved in
/// docs/notification_service_REAL.txt and gets restored on the home laptop.
import '../models/class_session.dart';

class NotificationService {
  static const leadMinutes = 10;

  static Future<void> init() async {}

  static Future<void> scheduleAll(List<ClassSession> sessions) async {}

  static Future<void> cancelAll() async {}
}