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
import 'package:iti_freelancing_hub/data/presentation/views/add_note.dart';
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
      child: BlocBuilder<GetalljobsCubit, GetalljobsState>( // Changed from BlocConsumer to BlocBuilder
        builder: (context, state) {
          return MainScaffold(
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GetStudentData(),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        s.myJobs,  
                        style: TextStyles.black15SemiBold,
                      ),
                      Container(
                        padding: EdgeInsets.all(4),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Color(0xFF44B30C)),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Center(
                          child: InkWell(
                            child: Text(
                              s.addNewJobButton, // New key needed: "addNewJobButton": "Add New Job"
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF44B30C),
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddNote(),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  CardOfFreelancerJob(),
                  SizedBox(height: 16),
                   Text(
                        s.myCertificates,  
                        style: TextStyles.black15SemiBold,
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
                          TextSpan(
                            text: s.contactAdminIntro,
                          ),
                          TextSpan(
                            text: s.chatLink,
                            style: TextStyle(color: kColors[0]),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Chat(),
                                  ),
                                );
                              },
                          ),
                          TextSpan(
                            text: s.contactAdminOutro,
                          ),
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