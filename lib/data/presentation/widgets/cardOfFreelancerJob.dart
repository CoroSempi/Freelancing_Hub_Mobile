import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iti_freelancing_hub/constants.dart';
import 'package:iti_freelancing_hub/core/utils/images/app_images.dart';
import 'package:iti_freelancing_hub/core/utils/styles.dart';
import 'package:iti_freelancing_hub/data/presentation/views/addNewJob.dart';
import 'package:iti_freelancing_hub/data/presentation/views/details.dart';

class CardOfFreelancerJob extends StatelessWidget {
  const CardOfFreelancerJob({
    Key? key,
    required this.title,
    required this.description,
    required this.contributors,
    required this.startDate,
    required this.completionDate,
    required this.budget,
    required this.currency,
    required this.comments,
  }) : super(key: key);

  final String title;
  final String description;
  final String contributors;
  final String startDate;
  final String completionDate;
  final String budget;
  final String currency;
  final String comments;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide.none,
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border(left: BorderSide(color: kColors[8], width: 5)),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              right: 0,
              child: SvgPicture.asset(
                'assets/images/accept.svg',
                width: 100.w,
                height: 100.h,
              ),
            ),

            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        title,
                        style: TextStyles.black15SemiBold.copyWith(
                          fontSize: 10,
                        ),
                      ),

                      const Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddNewJobScreen(),
                            ),
                          );
                        },
                        child: Text('Edite', style: TextStyles.red15SemiBold),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Text(description, style: TextStyles.red15SemiBoldOpacity),
                  SizedBox(height: 12.h),
                  Row(
                    children: [
                      Text(
                        'Contributors : ',
                        style: TextStyles.black12SemiBold,
                      ),
                      Text(contributors, style: TextStyles.grey12Medium),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    children: [
                      SvgPicture.asset(Assets.assetdate),
                      SizedBox(width: 5.w),
                      Text('Start : ', style: TextStyles.black12SemiBold),
                      SizedBox(width: 5.w),
                      Text(startDate, style: TextStyles.grey12Medium),
                      SizedBox(width: 10.w),
                      SvgPicture.asset(Assets.assetdate),
                      SizedBox(width: 5.w),
                      Text('End : ', style: TextStyles.black12SemiBold),
                      SizedBox(width: 5.w),
                      Text(completionDate, style: TextStyles.grey12Medium),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(Assets.assetsusd),
                          SizedBox(width: 5.w),
                          Text(budget, style: TextStyles.black12SemiBold),
                          SizedBox(width: 10.w),
                          SvgPicture.asset(Assets.assetsegp),
                          SizedBox(width: 5.w),
                          Text(currency, style: TextStyles.grey12Medium),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.comment,
                            size: 16,
                            color: Colors.black54,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '$comments Comments',
                            style: TextStyles.grey12Medium,
                          ),
                          const SizedBox(width: 8),
                          InkWell(
                            child: Text(
                              'READ MORE',
                              style: TextStyles.red15SemiBold,
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => JobDetails(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
