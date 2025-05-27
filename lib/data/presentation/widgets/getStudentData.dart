import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iti_freelancing_hub/constants.dart';
import 'package:iti_freelancing_hub/core/providers/setting_provider.dart';
import 'package:iti_freelancing_hub/core/utils/images/app_images.dart';
import 'package:iti_freelancing_hub/core/utils/styles.dart';
import 'package:iti_freelancing_hub/data/presentation/manger/cubit/getStudent-data/cubit/getstudentdata_cubit.dart';
import 'package:iti_freelancing_hub/data/presentation/manger/cubit/notification/notification_cubit.dart';
import 'package:iti_freelancing_hub/data/presentation/manger/cubit/notification/notification_state.dart';
import 'package:iti_freelancing_hub/data/presentation/views/notification.dart';
import 'package:provider/provider.dart';

class GetStudentData extends StatefulWidget {
  const GetStudentData({super.key});

  @override
  _GetStudentDataState createState() => _GetStudentDataState();
}

class _GetStudentDataState extends State<GetStudentData> {
  @override
  void initState() {
    super.initState();
    context.read<NotificationsCubit>().fetchNotifications();
  }

  @override
  Widget build(BuildContext context) {
    final settingsProviders = Provider.of<SettingsProvider>(context);
    var data = context.watch<GetstudentdataCubit>().userModel;

    return BlocBuilder<GetstudentdataCubit, GetstudentdataState>(
      builder: (context, state) {
        if (state is GetstudentdataLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetstudentdataSuccess) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        _buildProfileImage(data?.avatar),
                        const SizedBox(width: 10.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Welcome Back',
                              style: TextStyles.black20SemiBold.copyWith(
                                color:
                                    settingsProviders.isDark
                                        ? kColors[2]
                                        : kColors[1],
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 2.0),
                            Text(
                              data?.fullName?.split(' ').take(2).join(' ') ??
                                  'No Name',
                              style: TextStyles.black20SemiBold.copyWith(
                                color:
                                    settingsProviders.isDark
                                        ? kColors[2]
                                        : kColors[1],
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    InkWell(
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            padding: EdgeInsets.all(8),
                            child: SvgPicture.asset(
                              Assets.assetsImagesNotification,
                              width: 40,
                              height: 40,
                            ),
                          ),
                          BlocBuilder<NotificationsCubit, NotificationsState>(
                            builder: (context, state) {
                              int unseenCount = 0;
                              if (state is NotificationsLoaded) {
                                unseenCount =
                                    context
                                        .read<NotificationsCubit>()
                                        .unseenCount;
                              }
                              return Positioned(
                                top: -6,
                                right: 0,
                                child: Container(
                                  padding: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color : Colors.red,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Text(
                                    '$unseenCount',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Notifications(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),

                // Stats cards
                ...[
                  buildStyledCard(
                    "Track",
                    data?.trackName != null
                        ? data!.trackName!.split(' ').take(2).join(' ')
                        : "No Track",
                    settingsProviders,
                  ),
                  buildStyledCard(
                    "Total Jobs",
                    '${data?.jobs?.length ?? 0}',
                    settingsProviders,
                  ),
                  buildStyledCard(
                    "Completed and Approved Jobs",
                    '${data?.jobs?.where((job) => job.verified == true).length ?? 0}',
                    settingsProviders,
                  ),
                  buildStyledCard(
                    "Total Profit Earned (USD)",
                    '\$${data?.jobs?.where((job) => job.verified == true).fold<int>(0, (sum, job) => sum + (job.costInUSD ?? 0)) ?? 0}',
                    settingsProviders,
                  ),
                  buildStyledCard(
                    "Total Profit Earned (EGP)",
                    '${(data?.jobs?.where((job) => job.verified == true).fold<int>(0, (sum, job) => sum + (job.costInUSD ?? 0)) ?? 0) * 50} EGP',
                    settingsProviders,
                  ),
                ],

                if (data?.target == true)
                  Card(
                    color:
                        settingsProviders.isDark ? kColors[11] : Colors.white,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            Assets.assetsImagesCongratulation,
                            width: 50,
                            height: 50,
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              'Congratulations on reaching your target! We are incredibly proud of you and your hard work! This is a fantastic achievement, and we want you to take a moment to celebrate your success. Keep shining and moving forward, you’re doing great!',
                              style: TextStyles.black15Medium.copyWith(
                                color:
                                    settingsProviders.isDark
                                        ? Colors.white
                                        : Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                else
                  const SizedBox.shrink(),
              ],
            ),
          );
        } else {
          return const Center(
            child: Text('Error occurred', style: TextStyle(color: Colors.red)),
          );
        }
      },
    );
  }

  Widget buildStyledCard(
    String title,
    String value,
    SettingsProvider settingsProviders,
  ) {
    final titleColor = settingsProviders.isDark ? Colors.white : Colors.black;
    final valueColor = kColors[5];

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 6.0),
      decoration: BoxDecoration(
        color: settingsProviders.isDark ? kColors[11] : Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color:
                settingsProviders.isDark
                    ? Colors.black12
                    : Colors.grey.withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 14.0),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                title,
                style: TextStyles.black12SemiBoldWithHeight.copyWith(
                  color: titleColor,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            const SizedBox(width: 12.0),
            Expanded(
              flex: 1,
              child: Text(
                value,
                style: TextStyles.red15SemiBoldOpacity.copyWith(
                  color: valueColor,
                ),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.right,
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileImage(String? avatar) {
    if (avatar == null || avatar.isEmpty) {
      return SvgPicture.asset(
        Assets.assetsImagesPerson,
        width: 70.0,
        height: 70.0,
      );
    } else if (avatar.startsWith('data:image')) {
      try {
        final decodedBytes = base64Decode(avatar.split(',').last);
        return CircleAvatar(
          radius: 35,
          backgroundImage: MemoryImage(decodedBytes),
        );
      } catch (e) {
        return const Icon(Icons.error, color: Colors.red);
      }
    } else {
      return CircleAvatar(radius: 35, backgroundImage: NetworkImage(avatar));
    }
  }
}
