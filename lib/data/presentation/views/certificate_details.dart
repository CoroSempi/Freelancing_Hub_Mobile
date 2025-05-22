import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:iti_freelancing_hub/constants.dart';
import 'package:iti_freelancing_hub/core/providers/setting_provider.dart';
import 'package:iti_freelancing_hub/core/utils/images/app_images.dart';
import 'package:iti_freelancing_hub/core/utils/mainscafold.dart';
import 'package:iti_freelancing_hub/core/utils/remote/Dio-Helper.dart';
import 'package:iti_freelancing_hub/core/utils/styles.dart';
import 'package:iti_freelancing_hub/data/presentation/manger/cubit/cubit/certificate_details_cubit.dart';
import 'package:iti_freelancing_hub/data/presentation/views/homeScreen.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class CertificateDetails extends StatelessWidget {
  final String certificateId;
  const CertificateDetails({super.key, required this.certificateId});
  static const routeName = '/certificate_details';

  String clean(String? s) => s?.replaceAll('\u00A0', ' ').trim() ?? '';

  String formatDate(String? dateStr) {
    try {
      final date = DateTime.parse(dateStr ?? '');
      return DateFormat('MMM d, yyyy').format(date);
    } catch (_) {
      return dateStr ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (_) =>
              CertificateDetailsCubit()..getCertificateDetails(certificateId),
      child: BlocBuilder<CertificateDetailsCubit, CertificateDetailsState>(
        builder: (context, state) {
          final settingsProvider = Provider.of<SettingsProvider>(context);

          if (state is CertificateDetailsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CertificateDetailsError) {
            return Center(child: Text('Error: ${state.error}'));
          } else if (state is CertificateDetailsSuccess) {
            final cert = state.certificate;

            return MainScaffold(
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomAppBar(
                        backText: 'Back',
                        onBackPressed: () => Navigator.pop(context),
                        showPendingButton: true,
                        color: cert.verified ? kColors[8] : kColors[3],
                        statusText: cert.verified ? 'Accepted' : 'Pending',
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        clean(cert.company),
                        style: TextStyles.black20SemiBold.copyWith(
                          color:
                              settingsProvider.isDark ? kColors[2] : kColors[1],
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          Text(
                            'certificateId: ',
                            style: TextStyles.black12SemiBold.copyWith(
                              color:
                                  settingsProvider.isDark
                                      ? kColors[2]
                                      : kColors[1],
                            ),
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            cert.certificateId ?? '',
                            style: TextStyles.grey12Medium,
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        'Description: ',
                        style: TextStyles.black12SemiBold.copyWith(
                          color:
                              settingsProvider.isDark ? kColors[2] : kColors[1],
                        ),
                      ),
                      Text(
                        cert.certificateDescription,
                        style: TextStyles.grey12Medium,
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          Text(
                            'studentName: ',
                            style: TextStyles.black12SemiBold.copyWith(
                              color:
                                  settingsProvider.isDark
                                      ? kColors[2]
                                      : kColors[1],
                            ),
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            cert.studentName ?? '',
                            style: TextStyles.grey12Medium,
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),
                      Row(
                        children: [
                          Text(
                            'branch: ',
                            style: TextStyles.black12SemiBold.copyWith(
                              color:
                                  settingsProvider.isDark
                                      ? kColors[2]
                                      : kColors[1],
                            ),
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            cert.branch ?? '',
                            style: TextStyles.grey12Medium,
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),
                      Row(
                        children: [
                          SvgPicture.asset(Assets.assetdate),
                          SizedBox(width: 5.w),
                          Text(
                            'Start:',
                            style: TextStyles.black12SemiBold.copyWith(
                              color:
                                  settingsProvider.isDark
                                      ? kColors[2]
                                      : kColors[1],
                            ),
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            formatDate(cert.startDate),
                            style: TextStyles.grey12Medium,
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          SvgPicture.asset(Assets.assetdate),
                          SizedBox(width: 5.w),
                          Text(
                            'Completion:',
                            style: TextStyles.black12SemiBold.copyWith(
                              color:
                                  settingsProvider.isDark
                                      ? kColors[2]
                                      : kColors[1],
                            ),
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            formatDate(cert.endDate),
                            style: TextStyles.grey12Medium,
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          Text(
                            'Company:',
                            style: TextStyles.black12SemiBold.copyWith(
                              color:
                                  settingsProvider.isDark
                                      ? kColors[2]
                                      : kColors[1],
                            ),
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            cert.company ?? '',
                            style: TextStyles.grey12Medium,
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          Text(
                            'approach:',
                            style: TextStyles.black12SemiBold.copyWith(
                              color:
                                  settingsProvider.isDark
                                      ? kColors[2]
                                      : kColors[1],
                            ),
                          ),
                          SizedBox(width: 5.w),
                          Expanded(
                            child: Text(
                              cert.approach ?? '',
                              style: TextStyles.grey12Medium,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),
                      _buildLinkRow(
                        "proofOfCertificate",
                        cert.proofOfCertificate ?? '',
                        settingsProvider,
                      ),
                      SizedBox(height: 16.h),

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
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Container(
                                        padding: const EdgeInsets.all(16),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              'Certificate Deletion Confirmation',
                                              style: TextStyles.black20SemiBold,
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              "Are you sure you want to delete this certificate? This action cannot be undone.",
                                              style: TextStyles.grey12Medium,
                                            ),
                                            const SizedBox(height: 10),
                                            SvgPicture.asset(
                                              Assets.assetconfitm,
                                              height: 80,
                                            ),
                                            const SizedBox(height: 20),
                                            SizedBox(
                                              width: double.infinity,
                                              child: ElevatedButton(
                                                onPressed: () async {
                                                  Navigator.of(
                                                    context,
                                                  ).pop(); 
                                                  try {
                                                    await DioHelper.deleteCertificate(
                                                      certificateId,
                                                    );
                                                    ScaffoldMessenger.of(
                                                      context,
                                                    ).showSnackBar(
                                                      SnackBar(
                                                        backgroundColor:
                                                            kColors[8],
                                                        content: Center(
                                                          child: Text(
                                                            'Certificate deleted successfully',
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                    Navigator.pushAndRemoveUntil(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder:
                                                            (_) => HomeScreen(),
                                                      ),
                                                      (route) => false,
                                                    );
                                                  } catch (e) {
                                                    ScaffoldMessenger.of(
                                                      context,
                                                    ).showSnackBar(
                                                      SnackBar(
                                                        backgroundColor:
                                                            kColors[0],
                                                        content: Center(
                                                          child: Text(
                                                            'Failed to delete certificate',
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      settingsProvider.isDark
                                                          ? kColors[0]
                                                          : Colors.black,
                                                ),
                                                child: const Text(
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
                            onPressed: () => print('Edit Pressed'),
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
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }

  Widget _buildLinkRow(
    String title,
    String url,
    SettingsProvider settingsProvider,
  ) {
    final buttonText =
        title == 'proofOfCertificate' ? 'View Certificate' : 'Open Link';
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
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
                  const SizedBox(width: 4),
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
