import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iti_freelancing_hub/constants.dart';
import 'package:iti_freelancing_hub/core/utils/images/app_images.dart';
import 'package:iti_freelancing_hub/core/utils/styles.dart';
import 'package:iti_freelancing_hub/data/presentation/manger/cubit/getStudent-data/cubit/getstudentdata_cubit.dart';
import 'package:iti_freelancing_hub/data/presentation/views/notification.dart';

class GetStudentData extends StatefulWidget {
  const GetStudentData({super.key});

  @override
  _GetStudentDataState createState() => _GetStudentDataState();
}

class _GetStudentDataState extends State<GetStudentData> {
  @override
  Widget build(BuildContext context) {
    var data = context.watch<GetstudentdataCubit>().userModel;

    return BlocBuilder<GetstudentdataCubit, GetstudentdataState>(
      builder: (context, state) {
        if (state is GetstudentdataLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetstudentdataSuccess) {
          return SingleChildScrollView(
            padding: EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        // Profile picture
                        if (data?.avatar != null)
                          CircleAvatar(
                            radius: 20.0,
                            backgroundImage: NetworkImage(data!.avatar!),
                          )
                        else
                          SvgPicture.asset(
                            Assets.assetsImagesPerson,
                            width: 70.0,
                            height: 70.0,
                          ),
                         
                        SizedBox(width: 10.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Welcome Back',
                              style: TextStyles.black15Medium.copyWith(fontSize: 12.0),
                            ),
                            SizedBox(height: 2.0),
                           Text(
                              data?.fullName?.split(' ').take(2).join(' ') ??
                                  'No Name',
                              style: TextStyles.black20SemiBold.copyWith(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
               InkWell(
                      child: Stack(
                        children: [
                          Icon(
                            Icons.notifications,
                            size: 30.0,
                            color: kColors[0],
                          ),
                          Positioned(
                            right: 0,
                            top: 0,
                            child: Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: kColors[3],
                                shape: BoxShape.circle,
                              ),
                              constraints: BoxConstraints(
                                minWidth: 10,
                                minHeight: 10,
                              ),
                              child: Text(
                                '3',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
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
                SizedBox(height: 20.0),

                // Calculate stats
                ...[
                  buildStyledCard("Track", data?.trackName ?? "No Track"),
                  buildStyledCard("Total Jobs", '${data?.jobs?.length ?? 0}'),
                  buildStyledCard(
                    "Completed and Approved Jobs",
                    '${data?.jobs?.where((job) => job.verified == true).length ?? 0}',
                  ),
                  buildStyledCard(
                    "Total Profit Earned (USD)",
                    '\$${data?.jobs?.where((job) => job.verified == true).fold<int>(0, (sum, job) => sum + (job.costInUSD ?? 0)) ?? 0}',
                  ),
                  buildStyledCard(
                    "Total Profit Earned (EGP)",
                    '${(data?.jobs?.where((job) => job.verified == true).fold<int>(0, (sum, job) => sum + (job.costInUSD ?? 0)) ?? 0) * 50} EGP',
                  ),
                ],
                if (data?.target == true)
                  Card(
                    color: Colors.white,
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
                              'Congratulations  on reaching your target! We are incredibly proud of you and your hard work! This is a fantastic achievement, and we want you to take a moment to celebrate your success. Keep shining and moving forward, you’re doing great!',
                              style: TextStyles.black15Medium,
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
            child: Text(
              'Error occurred',
              style: TextStyle(color: Colors.red),
            ),
          );
        }
      },
    );
  }

  Widget buildStyledCard(String title, String value, [Color? color]) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 6.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12.0),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          blurRadius: 6.0,
          offset: const Offset(0, 3.0),
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
              style: TextStyles.black12SemiBoldWithHeight,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),

          const SizedBox(width: 12.0),

          /// القيمة
          Expanded(
            flex: 1,
            child: Text(
              value,
              style: TextStyles.red15SemiBoldOpacity,
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



}



