import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:iti_freelancing_hub/constants.dart';
import 'package:iti_freelancing_hub/core/providers/setting_provider.dart';
import 'package:iti_freelancing_hub/core/utils/images/app_images.dart';
import 'package:iti_freelancing_hub/core/utils/styles.dart';
import 'package:iti_freelancing_hub/data/models/certificationModel.dart';
import 'package:iti_freelancing_hub/data/presentation/manger/cubit/certificate-details/certificate_details_cubit.dart';
import 'package:iti_freelancing_hub/data/presentation/manger/cubit/get-all-certificate/cubit/getcertificate_cubit.dart';
import 'package:iti_freelancing_hub/data/presentation/views/certificate_details.dart';

class Cardofcertificate extends StatefulWidget {
  const Cardofcertificate({super.key});

  @override
  State<Cardofcertificate> createState() => _CardofcertificateState();
}

class _CardofcertificateState extends State<Cardofcertificate> {
  Future<List<CertificateData>> _getCertificates() {
    return context.read<GetcertificateCubit>().getCertificate().then((_) {
      return context.read<GetcertificateCubit>().certificates;
    });
  }

  @override
  Widget build(BuildContext context) {
    final settingsProviders = Provider.of<SettingsProvider>(context);

    return FutureBuilder<List<CertificateData>>(
      future: _getCertificates(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error loading certificates: ${snapshot.error}'),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No certificates available'));
        } else {
          final certificates = snapshot.data!;
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: certificates.length,
            itemBuilder: (context, index) {
              final certificate = certificates[index];
              return Container(
                margin: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                decoration: BoxDecoration(
                  color: settingsProviders.isDark ? kColors[11] : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color:
                          settingsProviders.isDark ? kColors[11] : Colors.white,
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      left: 0,
                      child:
                          certificate.verified == true
                              ? SvgPicture.asset(
                                Assets.assetacceptcer,
                                width: 100.w,
                                height: 100.h,
                              )
                              : SvgPicture.asset(
                                Assets.assetpendcer,
                                width: 100.w,
                                height: 100.h,
                              ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 16.h,
                        horizontal: 16.w,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              "${certificate.certificateId ?? ''}'s Certificate",
                              style: TextStyles.black10SemiBold.copyWith(
                                fontWeight: FontWeight.bold,
                                color:
                                    settingsProviders.isDark
                                        ? Colors.white
                                        : Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Center(
                            child: Text(
                              certificate.studentName ?? '',
                              style: TextStyles.red15SemiBold.copyWith(
                                color: kColors[5],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: Text(
                              certificate.certificateDescription ?? '',
                              style: TextStyles.grey12Medium,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: 18.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                Assets.assetdate,
                                width: 18.w,
                                height: 18.h,
                              ),
                              SizedBox(width: 6.w),
                              Text(
                                certificate.startDate ?? '',
                                style: TextStyles.black12SemiBold.copyWith(
                                  color:
                                      settingsProviders.isDark
                                          ? Colors.white
                                          : Colors.black,
                                ),
                              ),
                              SizedBox(width: 20.w),
                              SvgPicture.asset(
                                Assets.assetdate,
                                width: 18.w,
                                height: 18.h,
                              ),
                              SizedBox(width: 6.w),
                              Text(
                                certificate.endDate ?? '',
                                style: TextStyles.black12SemiBold.copyWith(
                                  color:
                                      settingsProviders.isDark
                                          ? Colors.white
                                          : Colors.black,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12.h),
                          Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (_) => BlocProvider(
                                          create:
                                              (_) =>
                                                  CertificateDetailsCubit()
                                                    ..getCertificateDetails(
                                                      certificate.id!,
                                                    ),
                                          child: CertificateDetails(
                                            certificateId: certificate.id!,
                                          ),
                                        ),
                                  ),
                                );
                              },
                              child: Text(
                                'Read More',
                                style: TextStyles.red15SemiBold,
                              ),
                            ),
                          ),
                        ],
                      ),
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