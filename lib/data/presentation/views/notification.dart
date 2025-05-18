import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iti_freelancing_hub/constants.dart';
import 'package:iti_freelancing_hub/core/providers/setting_provider.dart';
import 'package:iti_freelancing_hub/core/utils/mainscafold.dart';
import 'package:iti_freelancing_hub/core/utils/styles.dart';
import 'package:iti_freelancing_hub/data/presentation/manger/cubit/notification/notification_cubit.dart';
import 'package:iti_freelancing_hub/data/presentation/manger/cubit/notification/notification_state.dart';
import 'package:iti_freelancing_hub/data/presentation/views/homeScreen.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/comment.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});
  static const routeName = '/notifications';

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  void initState() {
    super.initState();
    context.read<NotificationsCubit>().fetchNotifications();
  }

  @override
  Widget build(BuildContext context) {
    final settingsProviders = Provider.of<SettingsProvider>(context);

    return MainScaffold(
      body: Column(
        children: [
          CustomAppBar(backText: "Back"),
          SizedBox(height: 8.h),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  'Notifications',
                  style: TextStyles.black12SemiBold.copyWith(
                    color: settingsProviders.isDark ? kColors[2] : kColors[1],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.h),
          Expanded(
            child: BlocBuilder<NotificationsCubit, NotificationsState>(
              builder: (context, state) {
                if (state is NotificationsLoading) {
                  return Center(
                    child: CircularProgressIndicator(color: kColors[0]),
                  );
                } else if (state is NotificationsLoaded) {
                  if (state.notifications.isEmpty) {
                    return Center(
                      child: Text(
                        'There are no notifications',
                        style: TextStyles.grey12Medium.copyWith(fontSize: 16),
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: state.notifications.length,
                    itemBuilder: (context, index) {
                      final notification = state.notifications[index];
                      return Comments(
                        content: notification.content,
                        seen: notification.seen,
                        onTap: () {
                          if (!notification.seen) {
                            context.read<NotificationsCubit>().markAsSeen(
                              notification.id,
                            );
                          }
                          Navigator.pushReplacementNamed(
                            context,
                            HomeScreen.routeName,
                          );
                        },
                      );
                    },
                  );
                } else if (state is NotificationsError) {
                  return Center(child: Text(state.message));
                } else {
                  return SizedBox.shrink();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
