import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iti_freelancing_hub/constants.dart';
import 'package:iti_freelancing_hub/core/utils/images/app_images.dart';
import 'package:iti_freelancing_hub/core/utils/mainscafold.dart';
import 'package:iti_freelancing_hub/core/utils/styles.dart';
import 'package:iti_freelancing_hub/data/presentation/manger/cubit/getAll-jobs/cubit/getalljobs_cubit.dart';
import 'package:iti_freelancing_hub/data/presentation/views/addNewJob.dart';
import 'package:iti_freelancing_hub/data/presentation/views/chat.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/cardOfCertificate.dart';
 import 'package:iti_freelancing_hub/data/presentation/widgets/cardOfFreelancerJob.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/getStudentData.dart';
 
class CustomeHome extends StatelessWidget {
  const CustomeHome({super.key});
 
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetalljobsCubit, GetalljobsState>(
      listener: (context, state) {},
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
                    SvgPicture.asset(Assets.assettag),
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: ShapeDecoration(
                        color: const Color(0x3344B40D),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Color(0xFF44B30C)),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Center(
                        child: InkWell(
                          child: Text(
                            'Add New Job',
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
                                builder: (context) => AddNewJobScreen(),
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
                          text:
                              'If you notice any discrepancies in the numbers or data displayed, please feel free to reach out to the admin through the ',
                        ),
                        TextSpan(
                          text: 'Chat',
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
                        TextSpan(text: ' feature for assistance.'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

