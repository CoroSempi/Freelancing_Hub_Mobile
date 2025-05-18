import 'package:iti_freelancing_hub/data/models/notification_model.dart';

class NotificationsResponse {
  final String id;
  final String studentId;
  final List<NotificationModel> notifications;

  NotificationsResponse({
    required this.id,
    required this.studentId,
    required this.notifications,
  });

  factory NotificationsResponse.fromJson(Map<String, dynamic> json) {
    return NotificationsResponse(
      id: json['_id'],
      studentId: json['studentID'],
      notifications: List<NotificationModel>.from(
        json['notifications'].map((x) => NotificationModel.fromJson(x)),
      ),
    );
  }
}
