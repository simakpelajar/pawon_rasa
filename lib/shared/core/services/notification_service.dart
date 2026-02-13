import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/foundation.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tzLib;

class NotificationService {
  static const String _dailyReminderChannelId = 'daily_reminder_channel_v2';
  static const String _instantChannelId = 'instant_notification_channel';

  static final NotificationService _instance = NotificationService._internal();

  factory NotificationService() {
    return _instance;
  }

  NotificationService._internal();

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    // Initialize timezone data
    tz.initializeTimeZones();
    _setLocalTimeZone();
    
    final androidInitializationSettings =
      const AndroidInitializationSettings('ic_notification');

    final iOSInitializationSettings =
        const DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    final initializationSettings =
        InitializationSettings(
      android: androidInitializationSettings,
      iOS: iOSInitializationSettings,
    );

    await _flutterLocalNotificationsPlugin.initialize(
      settings: initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        // Handle notification tap
      },
    );

    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();

    final androidPlugin = _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();

    if (androidPlugin != null) {
      const dailyChannel = AndroidNotificationChannel(
        _dailyReminderChannelId,
        'Daily Reminder',
        description: 'Daily reminder notifications',
        importance: Importance.max,
      );

      const instantChannel = AndroidNotificationChannel(
        _instantChannelId,
        'Instant Notifications',
        description: 'Instant notification channel',
        importance: Importance.max,
      );

      await androidPlugin.createNotificationChannel(dailyChannel);
      await androidPlugin.createNotificationChannel(instantChannel);
    }

    // Request permissions for iOS
    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  void _setLocalTimeZone() {
    final timeZoneName = DateTime.now().timeZoneName.trim();
    final mapped = _mapTimeZoneName(timeZoneName) ?? timeZoneName;
    final location = _tryGetLocation(mapped) ?? _mapOffsetLocation();

    if (location != null) {
      tzLib.setLocalLocation(location);
    }
  }

  String? _mapTimeZoneName(String name) {
    switch (name) {
      case 'WIB':
        return 'Asia/Jakarta';
      case 'WITA':
        return 'Asia/Makassar';
      case 'WIT':
        return 'Asia/Jayapura';
      default:
        return null;
    }
  }

  tzLib.Location? _tryGetLocation(String name) {
    try {
      return tzLib.getLocation(name);
    } catch (_) {
      return null;
    }
  }

  tzLib.Location? _mapOffsetLocation() {
    // Fallback for GMT offsets that are not valid IANA timezone names.
    final offsetHours = DateTime.now().timeZoneOffset.inHours;

    switch (offsetHours) {
      case 7:
        return _tryGetLocation('Asia/Jakarta');
      case 8:
        return _tryGetLocation('Asia/Makassar');
      case 9:
        return _tryGetLocation('Asia/Jayapura');
      default:
        return null;
    }
  }


  Future<void> scheduleDailyReminder({
    required String title,
    required String body,
    required String time,
    required int id,
  }) async {
    try {
      debugPrint('[Reminder] schedule request: id=$id time=$time title="$title"');
      final parts = time.split(':');
      final hour = int.parse(parts[0]);
      final minute = int.parse(parts[1]);

      // Get next occurrence of the scheduled time
      final now = tzLib.TZDateTime.now(tzLib.local);
      var scheduledDate =
          tzLib.TZDateTime(tzLib.local, now.year, now.month, now.day, hour, minute);

      // If the time has already passed today, schedule for tomorrow.
      // If user picks the current minute, schedule a few seconds from now.
      if (scheduledDate.isBefore(now)) {
        if (now.difference(scheduledDate).inMinutes == 0) {
          scheduledDate = now.add(const Duration(seconds: 5));
        } else {
          scheduledDate = scheduledDate.add(const Duration(days: 1));
        }
      }

      // Use inexact alarms to avoid exact alarm permission requirements.
      await _flutterLocalNotificationsPlugin.zonedSchedule(
        id: id,
        title: title,
        body: body,
        scheduledDate: scheduledDate,
        notificationDetails: NotificationDetails(
          android: AndroidNotificationDetails(
            _dailyReminderChannelId,
            'Daily Reminder',
            channelDescription: 'Daily reminder notifications',
            icon: 'ic_notification',
            importance: Importance.max,
            priority: Priority.high,
          ),
          iOS: const DarwinNotificationDetails(
            presentAlert: true,
            presentBadge: true,
            presentSound: true,
          ),
        ),
        androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
        matchDateTimeComponents: DateTimeComponents.time,
      );
      debugPrint('[Reminder] scheduled: id=$id at=$scheduledDate tz=${tzLib.local.name}');
      await _logPendingAfterSchedule(id);
    } catch (e) {
      debugPrint('[Reminder] schedule error: $e');
    }
  }

  /// Cancel a scheduled reminder
  Future<void> cancelReminder(int id) async {
    await _flutterLocalNotificationsPlugin.cancel(id: id);
  }

  /// Cancel all scheduled reminders
  Future<void> cancelAllReminders() async {
    await _flutterLocalNotificationsPlugin.cancelAll();
  }

  /// Show instant notification
  Future<void> showNotification({
    required String title,
    required String body,
    required int id,
  }) async {
    final androidNotificationDetails =
        const AndroidNotificationDetails(
      _instantChannelId,
      'Instant Notifications',
      channelDescription: 'Instant notification channel',
      icon: 'ic_notification',
      importance: Importance.max,
      priority: Priority.high,
    );

    final notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: const DarwinNotificationDetails(),
    );

    await _flutterLocalNotificationsPlugin.show(
      id: id,
      title: title,
      body: body,
      notificationDetails: notificationDetails,
    );
  }

  Future<void> _logPendingAfterSchedule(int id) async {
    final pending = await _flutterLocalNotificationsPlugin
        .pendingNotificationRequests();
    final hasId = pending.any((item) => item.id == id);
    debugPrint('[Reminder] pending after schedule: count=${pending.length} hasId=$hasId');
  }
}
