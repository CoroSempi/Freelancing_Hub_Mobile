import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:iti_freelancing_hub/constants.dart';
import 'package:iti_freelancing_hub/core/providers/setting_provider.dart';
import 'package:iti_freelancing_hub/core/utils/images/app_images.dart';
import 'package:iti_freelancing_hub/core/utils/styles.dart';
import 'package:iti_freelancing_hub/data/models/jobModel.dart';
import 'package:iti_freelancing_hub/data/presentation/manger/cubit/details/details_cubit.dart';
import 'package:iti_freelancing_hub/data/presentation/manger/cubit/getAll-jobs/cubit/getalljobs_cubit.dart';
import 'package:iti_freelancing_hub/data/presentation/views/add_note.dart';
import 'package:iti_freelancing_hub/data/presentation/views/details.dart';
import 'package:provider/provider.dart';

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

  String formatDate(DateTime date) {
    return DateFormat('MMM d, yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    final settingsProviders = Provider.of<SettingsProvider>(context);

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
                  color: settingsProviders.isDark ? kColors[11] : Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12.r),
                    bottomRight: Radius.circular(12.r),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color:
                          settingsProviders.isDark ? kColors[11] : Colors.white,
                    ),
                  ],
                  border: Border(
                    left: BorderSide(
                      color: job.verified == true ? kColors[8] : kColors[3],
                      width: 3.w,
                    ),
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: SvgPicture.asset(
                        job.verified == true
                            ? 'assets/images/accept.svg'
                            : 'assets/images/pend.svg',
                        width: 80.w,
                        height: 80.h,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                job.jobTitle ?? 'No Title',
                                style: TextStyles.black15SemiBold.copyWith(
                                  fontSize: 14.sp,
                                  color:
                                      settingsProviders.isDark
                                          ? Colors.white
                                          : Colors.black,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          job.jobType ?? 'No platform available',
                          style: TextStyles.red15SemiBold.copyWith(
                            color: kColors[5],
                            fontSize: 12.sp,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          job.jobDescription ?? 'No description available',
                          style: TextStyles.grey12Medium.copyWith(
                            fontSize: 12.sp,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 12.h),
                        Row(
                          children: [
                            Text(
                              job.jobType == 'Remote monthly job'
                                  ? 'Company Name: '
                                  : 'Contributors: ',
                              style: TextStyles.black12SemiBold.copyWith(
                                fontSize: 12.sp,
                                color:
                                    settingsProviders.isDark
                                        ? Colors.white
                                        : Colors.black,
                              ),
                            ),
                            Flexible(
                              child: Text(
                                job.jobType == 'Remote monthly job'
                                    ? (job.companytName != null ||
                                            job.companyCountry != null
                                        ? '${job.companytName ?? ''}${job.companytName != null && job.companyCountry != null ? ' - ' : ''}${job.companyCountry ?? ''}'
                                        : 'Unknown')
                                    : (job.teamMembers != null &&
                                        job.teamMembers!.isNotEmpty)
                                    ? (job.teamMembers!.first.studentName ??
                                        'Unknown')
                                    : 'Unknown',
                                style: TextStyles.grey12Medium.copyWith(
                                  fontSize: 12.sp,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12.h),
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    Assets.assetdate,
                                    width: 12.w,
                                    height: 12.h,
                                  ),
                                  SizedBox(width: 5.w),
                                  Text(
                                    'Start:',
                                    style: TextStyles.black12SemiBold.copyWith(
                                      fontSize: 8.sp,
                                      color:
                                          settingsProviders.isDark
                                              ? Colors.white
                                              : Colors.black,
                                    ),
                                  ),
                                  SizedBox(width: 5.w),
                                  Text(
                                    formatDate(job.startDate),
                                    style: TextStyles.grey12Medium.copyWith(
                                      fontSize: 8.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (job.endDate != null)
                              Expanded(
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      Assets.assetdate,
                                      width: 12.w,
                                      height: 12.h,
                                    ),
                                    SizedBox(width: 5.w),
                                    Text(
                                      'Completion:',
                                      style: TextStyles.black12SemiBold
                                          .copyWith(
                                            fontSize: 8.sp,
                                            color:
                                                settingsProviders.isDark
                                                    ? Colors.white
                                                    : Colors.black,
                                          ),
                                    ),
                                    SizedBox(width: 2.w),
                                    Text(
                                      formatDate(job.endDate!),
                                      style: TextStyles.grey12Medium.copyWith(
                                        fontSize: 8.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                        SizedBox(height: 12.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    Assets.assetsusd,
                                    width: 10,
                                    height: 10,
                                  ),
                                  SizedBox(width: 4.w),
                                  Text(
                                    '${job.paymentInUSD ?? 0} ',
                                    style: TextStyles.black12SemiBold.copyWith(
                                      fontSize: 12,
                                      color:
                                          settingsProviders.isDark
                                              ? Colors.white
                                              : Colors.black,
                                    ),
                                  ),
                                  SizedBox(width: 10.w),

                                  Padding(
                                    padding: EdgeInsets.all(0.0),
                                    child: SvgPicture.asset(
                                      Assets.assetsegp,

                                      width: 8,
                                      height: 8,
                                    ),
                                  ),
                                  SizedBox(width: 4.w),
                                  Text(
                                    '${job.paymentInEGP ?? 0} ',
                                    style: TextStyles.black12SemiBold.copyWith(
                                      fontSize: 12,

                                      color:
                                          settingsProviders.isDark
                                              ? Colors.white
                                              : Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.comment,
                                    size: 16.sp,
                                    color:
                                        settingsProviders.isDark
                                            ? Colors.white
                                            : Colors.black,
                                  ),
                                  SizedBox(width: 6.w),
                                  Flexible(
                                    child: Text(
                                      '${job.comments?.length ?? 0} Comments',
                                      style: TextStyles.grey12Medium,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  SizedBox(width: 2.w),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder:
                                              (_) => BlocProvider(
                                                create:
                                                    (_) =>
                                                        DetailsCubit()
                                                          ..fetchJobDetails(
                                                            job.id!,
                                                          ),
                                                child: JobDetails(
                                                  jobId: job.id!,
                                                ),
                                              ),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'Read More',
                                      style: TextStyles.red15SemiBold.copyWith(
                                        // color: kColors[5],
                                      ),
                                    ),
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