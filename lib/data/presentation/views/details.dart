import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:iti_freelancing_hub/constants.dart';
import 'package:iti_freelancing_hub/core/providers/setting_provider.dart';
import 'package:iti_freelancing_hub/core/utils/images/app_images.dart';
import 'package:iti_freelancing_hub/core/utils/mainscafold.dart';
import 'package:iti_freelancing_hub/core/utils/styles.dart';
import 'package:iti_freelancing_hub/data/presentation/manger/cubit/details/details_cubit.dart';
import 'package:iti_freelancing_hub/data/presentation/views/add_note.dart';
import 'package:iti_freelancing_hub/data/presentation/views/remoteMonthlyJob.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class JobDetails extends StatelessWidget {
  final String jobId;
  const JobDetails({super.key, required this.jobId});

  static const routeName = '/details';

  String clean(String? s) {
    return s?.replaceAll('\u00A0', ' ').trim() ?? '';
  }

  String formatDate(DateTime date) {
    return DateFormat('MMM d, yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(context);

    return MainScaffold(
      body: BlocListener<DetailsCubit, DetailsState>(
        listener: (context, state) {
          if (state is JobDeletedSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: kColors[8],
                content: Center(child: Text('Job deleted successfully')),
              ),
            );
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/home',
              (route) => false,
            );
          } else if (state is DetailsError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: kColors[0],
                content: Center(child: Text('Try Again')),
              ),
            );
          }
        },
        child: BlocBuilder<DetailsCubit, DetailsState>(
          builder: (context, state) {
            if (state is DetailsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is DetailsError) {
              return Center(child: Text('Error: ${state.message}'));
            } else if (state is DetailsLoaded) {
              final job = state.jobDetails;
              final canEdit = state.canEdit;
              final endDate = job.endDate;
              final verified = job.verified;
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomAppBar(
                        backText: 'Back',
                        onBackPressed: () => Navigator.pop(context),
                        showPendingButton: true,
                        color: job.verified ? kColors[8] : kColors[3],
                        statusText: job.verified ? 'Accepted' : 'Pending',
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        job.jobTitle,
                        style: TextStyles.black20SemiBold.copyWith(
                          color:
                              settingsProvider.isDark ? kColors[2] : kColors[1],
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        job.jobType,
                        style: TextStyles.grey12Medium.copyWith(
                          color: kColors[5],
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        job.jobDescription,
                        style: TextStyles.grey12Medium,
                        softWrap: true,
                      ),
                      SizedBox(height: 16.h),
                      if (job.teamMembers != null &&
                          job.teamMembers!.isNotEmpty) ...[
                        Row(
                          children: [
                            Text(
                              'Contributors: ',
                              style: TextStyles.black12SemiBold.copyWith(
                                color:
                                    settingsProvider.isDark
                                        ? kColors[2]
                                        : kColors[1],
                              ),
                            ),
                            Text(
                              job.teamMembers!
                                  .map(
                                    (e) =>
                                        e.studentName
                                            ?.split(' ')
                                            .take(2)
                                            .join(' ') ??
                                        'N/A',
                                  )
                                  .join(', '),
                              style: TextStyles.grey12Medium,
                            ),
                          ],
                        ),
                      ] else ...[
                        _buildDetailRow(
                          'Student Name',
                          job.studentName?.split(' ').take(2).join(' ') ??
                              'N/A',
                          settingsProvider,
                        ),
                      ],
                      SizedBox(height: 16.h),
                      if (job.jobType == "Remote monthly job") ...[
                        _buildDetailRow(
                          "companytName",
                          job.companytName ?? 'N/A',
                          settingsProvider,
                        ),
                        _buildDetailRow(
                          "companyCountry",
                          job.companyCountry ?? 'N/A',
                          settingsProvider,
                        ),
                        _buildDetailRow(
                          "companyContact",
                          job.companyContact ?? 'N/A',
                          settingsProvider,
                        ),
                        _buildLinkRow(
                          "proofOfWork",
                          job.proofOfWork ?? 'N/A',
                          settingsProvider,
                        ),
                      ],
                      if (clean(job.jobType) ==
                              "Freelancing job with direct contact" ||
                          clean(job.jobType) ==
                              "Freelancing job on platform") ...[
                        _buildDetailRow(
                          "Client Name",
                          job.clientName ?? 'N/A',
                          settingsProvider,
                        ),
                        _buildDetailRow(
                          "Client Country",
                          job.clientCountry ?? 'N/A',
                          settingsProvider,
                        ),
                        _buildDetailRow(
                          "Platform",
                          job.platform ?? 'N/A',
                          settingsProvider,
                        ),
                        _buildDetailRow(
                          "Student Profile",
                          job.platform ?? 'N/A',
                          settingsProvider,
                        ),
                        _buildLinkRow(
                          "Client Profile on The Platform",
                          job.clientContact ?? job.clientProfile ?? 'N/A',
                          settingsProvider,
                        ),
                        _buildLinkRow(
                          "Proof of work",
                          job.proofOfWork ?? '',
                          settingsProvider,
                        ),
                        SizedBox(height: 16.h),
                      ],
                      Row(
                        children: [
                          SvgPicture.asset(Assets.assetdate),
                          SizedBox(width: 5.w),
                          Text(
                            'Start: ',
                            style: TextStyles.black12SemiBold.copyWith(
                              color:
                                  settingsProvider.isDark
                                      ? kColors[2]
                                      : kColors[1],
                            ),
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            formatDate(job.startDate.toLocal()),
                            style: TextStyles.grey12Medium,
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      if (endDate != null)
                        Row(
                          children: [
                            SvgPicture.asset(Assets.assetdate),
                            SizedBox(width: 5.w),
                            Text(
                              'Completion: ',
                              style: TextStyles.black12SemiBold.copyWith(
                                color:
                                    settingsProvider.isDark
                                        ? kColors[2]
                                        : kColors[1],
                              ),
                            ),
                            SizedBox(width: 5.w),
                            Text(
                              formatDate(endDate.toLocal()),
                              style: TextStyles.grey12Medium,
                            ),
                          ],
                        ),
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          SvgPicture.asset(Assets.assetsusd),
                          SizedBox(width: 5.w),
                          Text(
                            '${job.costInUSD ?? job.paymentInUSD}',
                            style: TextStyles.black12SemiBold.copyWith(
                              color:
                                  settingsProvider.isDark
                                      ? kColors[2]
                                      : kColors[1],
                            ),
                          ),
                          SizedBox(width: 10.w),
                          SvgPicture.asset(Assets.assetsegp),
                          SizedBox(width: 5.w),
                          Text(
                            '${job.costInEGP ?? job.paymentInEGP}',
                            style: TextStyles.grey12Medium.copyWith(
                              fontWeight: FontWeight.bold,
                              color:
                                  settingsProvider.isDark
                                      ? kColors[2]
                                      : kColors[1],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        'Comments',
                        style: TextStyles.black20SemiBold.copyWith(
                          color:
                              settingsProvider.isDark ? kColors[2] : kColors[1],
                        ),
                      ),
                      SizedBox(height: 4.h),
                      job.comments.isEmpty
                          ? Text(
                            'No Comments Yet',
                            style: TextStyles.grey12Medium.copyWith(
                              fontSize: 12,
                            ),
                          )
                          : Column(
                            children:
                                job.comments.map((comment) {
                                  return ListTile(
                                    title: Text(comment.content),
                                    subtitle: Text(
                                      formatDate(comment.date.toLocal()),
                                      style: TextStyles.grey12Medium,
                                    ),
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text('${comment.rate}'),
                                        Icon(Icons.favorite, color: kColors[0]),
                                      ],
                                    ),
                                  );
                                }).toList(),
                          ),
                      SizedBox(height: 16.h),
                      if (canEdit && !verified)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder:
                                      (_) => Dialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                        child: Container(
                                          width:
                                              MediaQuery.of(
                                                context,
                                              ).size.width *
                                              0.9,
                                          padding: EdgeInsets.all(16),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                'Job Deletion Confirmation',
                                                style:
                                                    TextStyles.black20SemiBold,
                                              ),
                                              SizedBox(height: 10),
                                              Text(
                                                "Are you sure you want to delete this job? This action cannot be undone.",
                                                style: TextStyles.grey12Medium,
                                              ),
                                              SizedBox(height: 10),
                                              SvgPicture.asset(
                                                Assets.assetconfitm,
                                                height: 80,
                                              ),
                                              SizedBox(height: 20),
                                              SizedBox(
                                                width: double.infinity,
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                    context
                                                        .read<DetailsCubit>()
                                                        .deleteJob(
                                                          jobId,
                                                          job.jobType,
                                                        );
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                        backgroundColor:
                                                            settingsProvider
                                                                    .isDark
                                                                ? kColors[0]
                                                                : Colors.black,
                                                      ),
                                                  child: Text(
                                                    'Confirm',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: kColors[0],
                                side: BorderSide(color: kColors[0]),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: const Text('Delete'),
                            ),
                            SizedBox(width: 10.w),
                            ElevatedButton(
                              onPressed: () {
                                if (clean(job.jobType) ==
                                    'Remote monthly job') {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) => Remotemonthlyjob(
                                            jobId: jobId,
                                            existingJobData: {
                                              'jobTitle': job.jobTitle,
                                              'jobDescription':
                                                  job.jobDescription,
                                              'startDate':
                                                  job.startDate
                                                      .toIso8601String(),
                                              'paymentInUSD':
                                                  job.paymentInUSD ?? '',
                                              'paymentInEGP':
                                                  job.paymentInEGP ?? '',
                                              'companytName':
                                                  job.companytName ?? '',
                                              'companyCountry':
                                                  job.companyCountry ?? '',
                                              'companyContact':
                                                  job.companyContact ?? '',
                                              'proofOfWork':
                                                  job.proofOfWork ?? '',
                                            },
                                          ),
                                    ),
                                  );
                                } else {
                                  // Navigate to other job edit screen if needed
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) =>
                                              AddNote(), // أو شاشة التعديل الخاصة بنوع الوظيفة التاني
                                    ),
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: kColors[1],
                                foregroundColor: kColors[2],
                                side: BorderSide(color: kColors[1]),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: const Text('Edit'),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Widget _buildDetailRow(
    String title,
    String value,
    SettingsProvider settingsProvider,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$title: ',
            style: TextStyles.black12SemiBold.copyWith(
              color: settingsProvider.isDark ? kColors[2] : kColors[1],
            ),
          ),
          Expanded(
            child: Text(value, style: TextStyles.grey12Medium, softWrap: true),
          ),
        ],
      ),
    );
  }

  Widget _buildLinkRow(
    String title,
    String url,
    SettingsProvider settingsProvider,
  ) {
    final String buttonText =
        title == 'proofOfWork'
            ? 'View Proof'
            : title == 'Client Profile on The Platform'
            ? 'Open Profile'
            : 'Open Link';

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '$title: ',
            style: TextStyles.black12SemiBold.copyWith(
              color: settingsProvider.isDark ? kColors[2] : kColors[1],
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () async {
                final uri = Uri.tryParse(url);
                if (uri != null && await canLaunchUrl(uri)) {
                  await launchUrl(uri, mode: LaunchMode.externalApplication);
                }
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    buttonText,
                    style: TextStyle(
                      color: settingsProvider.isDark ? kColors[5] : kColors[6],
                    ),
                  ),
                  SizedBox(width: 4),
                  Icon(
                    Icons.attach_file,
                    size: 18,
                    color: settingsProvider.isDark ? kColors[5] : kColors[6],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
