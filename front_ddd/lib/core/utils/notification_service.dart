import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin _notifications =
      FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings();
    const settings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );
    await _notifications.initialize(settings);
  }

  Future<void> showBusArrivalNotification(String busNumber, int minutes) async {
    const androidDetails = AndroidNotificationDetails(
      'bus_arrival',
      'Arrivée Bus',
      channelDescription: 'Notifications pour l\'arrivée des bus',
      importance: Importance.high,
      priority: Priority.high,
    );
    const iosDetails = DarwinNotificationDetails();
    const details = NotificationDetails(android: androidDetails, iOS: iosDetails);

    await _notifications.show(
      0,
      '🚌 Bus $busNumber arrive',
      'Le bus $busNumber arrive dans $minutes minutes',
      details,
    );
  }
}
