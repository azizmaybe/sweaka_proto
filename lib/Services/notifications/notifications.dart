import 'dart:convert';

import '../../models/notifications.dart';
import '../APIs/api.dart';

class NotificationRepository {
  static Future<List<NotificationModel>> loadNotificationonline(
      {int page = 1, List<NotificationModel> previous_Notification = const []}) async {
    String url = "notifications/";
    url += "?page=$page";

    try {
      final response = await MainApi.Get(
        url: url,
      );
      var decodedJson = json.decode(response!.body);
      print(decodedJson);
      int orders_count = decodedJson['count'] ?? 0;

      if (orders_count == 0) {
        return [];
      }

      List<NotificationModel> Notifications =
          List<NotificationModel>.from(decodedJson['results'].map((e) => NotificationModel.fromMap(
                e,
              )));
      return Notifications;
    } catch (e) {
      print(e);
      print("error loading Notification");
      return [];
    }
  }

}
