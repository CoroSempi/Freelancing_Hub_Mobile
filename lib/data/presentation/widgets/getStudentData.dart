import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
// Add import for localization
import 'package:iti_freelancing_hub/generated/l10n.dart';

class GetStudentData extends StatefulWidget {
  const GetStudentData({super.key});

  @override
  _GetStudentDataState createState() => _GetStudentDataState();
}

class _GetStudentDataState extends State<GetStudentData> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<NotificationsCubit>().fetchNotifications();
      // context.read<GetstudentdataCubit>().fetchStudentData(); // Added to fetch student data
    });
  }

  @override
  Widget build(BuildContext context) {
    final settingsProviders = Provider.of<SettingsProvider>(context);
    final s = S.of(context); // Added for localization
    var data = context.watch<GetstudentdataCubit>().userModel;

    return BlocBuilder<GetstudentdataCubit, GetstudentdataState>(
      builder: (context, state) {
        final isArabic = Localizations.localeOf(context).languageCode == 'ar';
        final customFontFamily = isArabic ? 'shamelfabily' : null;
        final customFontFamilyBold = isArabic ? 'shamelfabilyBold' : null;

        if (state is GetstudentdataLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetstudentdataSuccess) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(8.0),
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
                              s.welcomeBackMessage,
                              style: TextStyles.black20SemiBold.copyWith(
                                color:
                                    settingsProviders.isDark
                                        ? kColors[2]
                                        : kColors[1],
                                fontSize: 12,
                                fontFamily: customFontFamilyBold,
                              ),
                            ),
                            const SizedBox(height: 2.0),
                            Text(
                              data?.fullName?.split(' ').take(2).join(' ') ??
                                  s.defaultUserName,
                              style: TextStyles.black20SemiBold.copyWith(
                                color:
                                    settingsProviders.isDark
                                        ? kColors[2]
                                        : kColors[1],
                                fontSize: 14,
                                fontFamily: customFontFamilyBold,
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
                                    color: Colors.red,
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
                    s.trackLabel,
                    data?.trackName != null
                        ? data!.trackName!.split(' ').take(2).join(' ')
                        : s.defaultTrackName,
                    settingsProviders,
                    fontFamily: customFontFamily,
                    fontFamilyBold: customFontFamilyBold,
                  ),
                  buildStyledCard(
                    s.totalJobsLabel,
                    '${data?.jobs?.length ?? 0}',
                    settingsProviders,
                    fontFamily: customFontFamily,
                    fontFamilyBold: customFontFamilyBold,
                  ),
                  buildStyledCard(
                    s.completedJobsLabel,
                    '${data?.jobs?.where((job) => job.verified == true).length ?? 0}',
                    settingsProviders,
                    fontFamily: customFontFamily,
                    fontFamilyBold: customFontFamilyBold,
                  ),
                  buildStyledCard(
                    s.totalProfitUSDLabel,
                    '\$${data?.jobs?.where((job) => job.verified == true).fold<int>(0, (sum, job) => sum + (job.costInUSD ?? 0)) ?? 0}',
                    settingsProviders,
                    fontFamily: customFontFamily,
                    fontFamilyBold: customFontFamilyBold,
                  ),
                  buildStyledCard(
                    s.totalProfitEGPLabel,
                    '${(data?.jobs?.where((job) => job.verified == true).fold<int>(0, (sum, job) => sum + (job.costInUSD ?? 0)) ?? 0) * 50} ${s.currencyEGP}',
                    settingsProviders,
                    fontFamily: customFontFamily,
                    fontFamilyBold: customFontFamilyBold,
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
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        // vertical: 8.h,
                        horizontal: 0.w,
                      ),
                      padding: EdgeInsets.all(10.w),
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
                              s.targetReachedMessage,
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
        } else if (state is GetstudentdataFailure) {
          return Center(
            child: Text(
              s.errorOccurredMessage, // New key needed: "errorOccurredMessage": "Error occurred"
              style: const TextStyle(color: Colors.red),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget buildStyledCard(
    String title,
    String value,
    SettingsProvider settingsProviders, {
    String? fontFamily,
    String? fontFamilyBold,
  }) {
    final titleColor = settingsProviders.isDark ? Colors.white : Colors.black;
    final valueColor = kColors[5];

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 0.0),
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
                  fontFamily: fontFamilyBold,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            SizedBox(width: 12.h),
            Expanded(
              flex: 1,
              child: Text(
                value,
                style: TextStyles.red15SemiBoldOpacity.copyWith(
                  color: valueColor,
                  fontFamily: fontFamily,
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
        return SvgPicture.asset(
          Assets.assetsImagesPerson,
          width: 70.0,
          height: 70.0,
        ); // Fallback to SVG instead of error icon
      }
    } else {
      return CircleAvatar(radius: 35, backgroundImage: NetworkImage(avatar));
    }
  }
}
