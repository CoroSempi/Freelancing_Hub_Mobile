import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_freelancing_hub/core/utils/remote/Dio-Helper.dart';
import 'package:iti_freelancing_hub/data/models/notification_model.dart';
import 'notification_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit() : super(NotificationsInitial());

  List<NotificationModel> _notifications = [];

  void fetchNotifications() async {
    emit(NotificationsLoading());
    try {
      final response = await DioHelper.getNotifications();
      print('Response data: ${response.data}');
      _notifications =
          (response.data['notifications'] as List)
              .map((e) => NotificationModel.fromJson(e))
              .toList();
      emit(NotificationsLoaded(_notifications));
    } catch (e) {
      emit(NotificationsError('Failed to load notifications:'));
    }
  }

  void markAsSeen(String notificationId) async {
    try {
      await DioHelper.NotificationAsSeen(notificationId);

      // Update locally:
      final index = _notifications.indexWhere((n) => n.id == notificationId);
      if (index != -1) {
        _notifications[index] = _notifications[index].copyWith(seen: true);
        emit(
          NotificationsLoaded(List.from(_notifications)),
        ); // Force UI rebuild
      }
    } catch (e) {
      print('Failed to mark notification as seen');
    }
  }
}
