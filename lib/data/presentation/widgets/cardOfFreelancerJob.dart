import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iti_freelancing_hub/constants.dart';
import 'package:iti_freelancing_hub/core/utils/images/app_images.dart';
import 'package:iti_freelancing_hub/core/utils/styles.dart';
import 'package:iti_freelancing_hub/data/models/jobModel.dart';
import 'package:iti_freelancing_hub/data/presentation/manger/cubit/getAll-jobs/cubit/getalljobs_cubit.dart';
import 'package:iti_freelancing_hub/data/presentation/views/addNewJob.dart';
import 'package:iti_freelancing_hub/data/presentation/views/details.dart';

class CardOfFreelancerJob extends StatefulWidget {
  const CardOfFreelancerJob({super.key});

  @override
  State<CardOfFreelancerJob> createState() => _CardOfFreelancerJobState();
}

class _CardOfFreelancerJobState extends State<CardOfFreelancerJob> {
  late Future<List<JobData>> jobsFuture;

  @override
  void initState() {
    super.initState();
    jobsFuture = context.read<GetalljobsCubit>().getAllJobs().then((_) {
      return context.read<GetalljobsCubit>().jobs;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<JobData>>(
      future: jobsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error loading jobs'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No jobs available'));
        } else {
          final jobs = snapshot.data!;
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: jobs.length,
            itemBuilder: (context, index) {
              final job = jobs[index];
              return Container(
                margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                padding: EdgeInsets.all(12.w),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12.r),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.15),
          blurRadius: 6,
          offset: const Offset(0, 3),
        ),
      ],
      border: Border(
        left: BorderSide(
          color: job.verified == true ? kColors[8] : Colors.transparent,
          width: 5.w,
        ),
      ),
    ),
                
                child: Stack(
                  children: [
                    // Positioned accept/check mark svg bottom right
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: job.verified == true
                          ?    SvgPicture.asset(
                                         'assets/images/accept.svg',
                        width: 80.w,
                        height: 80.h,
                        fit: BoxFit.contain,
                      )
                          :    SvgPicture.asset(
                                         'assets/images/pend.svg',
                        width: 80.w,
                        height: 80.h,
                        fit: BoxFit.contain,
                      ),    
                      
                   
                    ),

                    // Main content column
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title + Edit button row
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                job.jobTitle ?? 'No Title',
                                style: TextStyles.black15SemiBold.copyWith(fontSize: 14.sp),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => AddNewJobScreen()),
                                );
                              },
                              child: Text('Edit', style: TextStyles.red15SemiBold.copyWith(fontSize: 14.sp)),
                            ),
                          ],
                        ),

                        SizedBox(height: 8.h),
   Text(
                          job.platform ?? 'No platform available',
                          style: TextStyles.red15SemiBold.copyWith(color: TextStyles.red15SemiBold.color?.withOpacity(0.5), fontSize: 12.sp),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                                                SizedBox(height: 8.h),

                        // Description
                        Text(
                          job.jobDescription ?? 'No description available',
                          style: TextStyles.grey12Medium.copyWith(fontSize: 12.sp),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),

                        SizedBox(height: 12.h),

                        // Contributors
                        Row(
                          children: [
                            Text('Contributors: ', style: TextStyles.black12SemiBold.copyWith(fontSize: 12.sp)),
                            Flexible(
                              child: Text(
  (job.teamMembers != null && job.teamMembers!.isNotEmpty)
      ? job.teamMembers!.first.studentName ?? 'Unknown'
      : 'Unknown',
  style: TextStyles.grey12Medium.copyWith(fontSize: 12.sp),
  overflow: TextOverflow.ellipsis,
),
                            ),
                          ],
                        ),

                        SizedBox(height: 12.h),

                        // Dates Row
                        Row(
                          children: [
                           
                          Expanded(
                              child: Row(
                                children: [
                                   SvgPicture.asset(Assets.assetdate, width: 16.w, height: 16.h),
                            SizedBox(width: 5.w),
                            Text('Start:', style: TextStyles.black12SemiBold.copyWith(fontSize: 8.sp)),
                            SizedBox(width: 5.w),
                            Text(
                              job.startDate != null
                                  ? (job.startDate is DateTime
                                      ? (job.startDate as DateTime).toIso8601String().split('T').first
                                      : job.startDate.toString().split('T').first)
                                  : '',
                              style: TextStyles.grey12Medium.copyWith(fontSize: 8.sp),
                            ),
                                ],
                              ),
                            ) ,


                            Expanded(
                              child: Row(
                                children: [
                                    SvgPicture.asset(Assets.assetdate, width: 16.w, height: 16.h),
                            SizedBox(width: 5.w),
                            Text('Completion:', style: TextStyles.black12SemiBold.copyWith(fontSize: 8.sp)),
                            SizedBox(width: 5.w),
                            Text(
                              job.endDate != null
                                  ? (job.endDate is DateTime
                                      ? (job.endDate as DateTime).toIso8601String().split('T').first
                                      : job.endDate.toString().split('T').first)
                                  : '',
                              style: TextStyles.grey12Medium.copyWith(fontSize: 8.sp),
                            ),
                                ],
                              ),
                            ) ,
                          
                          ],
                        ),

                        SizedBox(height: 12.h),

                        // Budget + Comments + Read More Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Budget Row
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(Assets.assetsusd, width: 8.w, height: 13.h),
                                  SizedBox(width: 4.w),
                                  Text('${job.costInUSD ?? 0} ', style: TextStyles.black12SemiBold.copyWith(fontSize: 7.sp)),
                                  SizedBox(width: 10.w),
                                  SvgPicture.asset(Assets.assetsegp, width: 22.w, height: 13.h),
                                  SizedBox(width: 4.w),
                                  Text('${job.costInEGP ?? 0} ', style: TextStyles.black12SemiBold ),
                                ],
                              ),
                            ),

 


                            // Comments + Read More
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(Icons.comment, size: 16.sp, color: Colors.black54),
                                  SizedBox(width: 6.w),
                                  Flexible(
                                    child: Text(
                                      '${job.comments?.length ?? 0} Comments',
                                      style: TextStyles.grey12Medium ,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  SizedBox(width: 2.w),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => JobDetails()),
                                      );
                                    },
                                    child: Text('Read More', style: TextStyles.red15SemiBold ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
         
         
            },
          );
        }
      },
    );
  }
}
