import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Fixed import
import 'package:iti_freelancing_hub/constants.dart';
import 'package:iti_freelancing_hub/core/providers/setting_provider.dart';
import 'package:iti_freelancing_hub/core/utils/images/app_images.dart';
import 'package:iti_freelancing_hub/core/utils/mainscafold.dart';
import 'package:iti_freelancing_hub/core/utils/styles.dart';
import 'package:iti_freelancing_hub/data/presentation/manger/cubit/getAll-jobs/cubit/getalljobs_cubit.dart';
import 'package:iti_freelancing_hub/data/presentation/manger/cubit/getStudent-data/cubit/getstudentdata_cubit.dart';
import 'package:iti_freelancing_hub/data/presentation/views/addNewJob.dart';
import 'package:iti_freelancing_hub/data/presentation/views/add_certificate.dart';
import 'package:iti_freelancing_hub/data/presentation/views/chat.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/cardOfCertificate.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/cardOfFreelancerJob.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/getStudentData.dart';
import 'package:iti_freelancing_hub/generated/l10n.dart';
import 'package:provider/provider.dart';

class CustomeHome extends StatefulWidget {
  const CustomeHome({super.key});

  @override
  State<CustomeHome> createState() => _CustomeHomeState();
}

class _CustomeHomeState extends State<CustomeHome> {
  @override
  void initState() {
    super.initState();
    context.read<GetstudentdataCubit>().getStudentData();
    context.read<GetalljobsCubit>().getAllJobs(); // Added to load jobs
  }

  @override
  Widget build(BuildContext context) {
    final settingsProviders = Provider.of<SettingsProvider>(context);
    final s = S.of(context); // Added for localization

    return BlocProvider(
      create: (context) => GetalljobsCubit(),
      child: BlocBuilder<GetalljobsCubit, GetalljobsState>(
        // Changed from BlocConsumer to BlocBuilder
        builder: (context, state) {
          return MainScaffold(
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GetStudentData(),
                  // SizedBox(height: 10.h),
                  Container(
                    margin: EdgeInsets.symmetric(
                      //     vertical: 8.h,
                      horizontal: 8.w,
                    ),
                    // padding: EdgeInsets.all(12.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(Assets.assetsRectangle),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text(
                                s.myJobs,
                                style: TextStyles.black15SemiBold.copyWith(
                                  color:
                                      settingsProviders.isDark
                                          ? Colors.white
                                          : Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),

                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: ShapeDecoration(
                            color: Color(0xFFd3e9c8),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Color(0xFF6ac23e)),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Center(
                            child: InkWell(
                              child: Text(
                                s.addNewJobButton, // New key needed: "addNewJobButton": "Add New Job"
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF6ac23e),

                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AddNewJobScreen(),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  CardOfFreelancerJob(),
                  // SizedBox(height: 16),
                  Container(
                    margin: EdgeInsets.symmetric(
                      // vertical: 6.h,
                      horizontal: 8.w,
                    ),
                    // padding: EdgeInsets.all(12.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(Assets.assetsRectangle),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text(
                                s.myCertificates,
                                style: TextStyles.black15SemiBold.copyWith(
                                  color:
                                      settingsProviders.isDark
                                          ? Colors.white
                                          : Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: ShapeDecoration(
                            color: Color(0xFFd3e9c8),

                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Color(0xFF6ac23e)),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Center(
                            child: InkWell(
                              child: Text(
                                s.addNewCertificate,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF6ac23e),
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              onTap: () async {
                                final added = await Navigator.push<bool>(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AddCertificate(),
                                  ),
                                );

                                if (added == true) {
                                  setState(() {});
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 16),
                  Cardofcertificate(),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        style: TextStyles.black15Medium,
                        children: <TextSpan>[
                          TextSpan(text: s.contactAdminIntro),
                          TextSpan(
                            text: s.chatLink,
                            style: TextStyle(color: kColors[0]),
                            recognizer:
                                TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Chat(),
                                      ),
                                    );
                                  },
                          ),
                          TextSpan(text: s.contactAdminOutro),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
