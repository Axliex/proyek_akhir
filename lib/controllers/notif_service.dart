import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Noti{
  static Future initialize(FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var androidInitialize = new AndroidInitializationSettings('mipmap/ic_launcher');
    var iOSInitialize = new DarwinInitializationSettings();
    var initializationsSettings = new InitializationSettings(android: androidInitialize,
        iOS: iOSInitialize);
    await flutterLocalNotificationsPlugin.initialize(initializationsSettings );
  }

  static Future showBigTextNotification({var id =0,required String title, required String body,
    var payload, required FlutterLocalNotificationsPlugin fln
  } ) async {
    AndroidNotificationDetails androidPlatformChannelSpecifics =
    new AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      channelDescription: 'This is a description of the channel', // Description of the channel
      importance: Importance.max, // Importance level
      priority: Priority.high, // Priority level
    );

    // var not= NotificationDetails(android: androidPlatformChannelSpecifics,
    //     iOS: IOSNotificationDetails()
    // );
    var not= NotificationDetails(android: androidPlatformChannelSpecifics);
    await fln.show(0, title, body,not );
  }

}