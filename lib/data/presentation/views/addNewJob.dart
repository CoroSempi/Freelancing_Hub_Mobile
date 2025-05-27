import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iti_freelancing_hub/constants.dart';
import 'package:iti_freelancing_hub/core/providers/setting_provider.dart';
import 'package:iti_freelancing_hub/core/utils/mainscafold.dart';
import 'package:iti_freelancing_hub/core/utils/styles.dart';
import 'package:iti_freelancing_hub/data/presentation/views/add_note.dart';
import 'package:iti_freelancing_hub/data/presentation/views/directContentScreen.dart';
import 'package:iti_freelancing_hub/data/presentation/views/homeScreen.dart';
import 'package:iti_freelancing_hub/data/presentation/views/platFormScreen.dart';
import 'package:iti_freelancing_hub/data/presentation/views/remoteMonthlyJob.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/CustomButtonWidget.dart';
import 'package:provider/provider.dart';

class AddNewJobScreen extends StatefulWidget {
  static const routeName = '/add-task';

  @override
  State<AddNewJobScreen> createState() => _AddNewJobScreenState();
}

class _AddNewJobScreenState extends State<AddNewJobScreen> {
  String? jobType;

  void _navigateToNextScreen() {
    if (jobType == 'platform') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => AddNote(),

          // PlatformScreen()
        ),
      );
    } else if (jobType == 'directContact') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => AddNote(),

          // DirectContentScreen()
        ),
      );
    } else if (jobType == 'remoteMonthly') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => Remotemonthlyjob()),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Please select a job type first")));
    }
  }

  @override
  Widget build(BuildContext context) {
    final settingsProviders = Provider.of<SettingsProvider>(context);

    return MainScaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add New Job',
                style: TextStyles.black20SemiBold.copyWith(
                  color: settingsProviders.isDark ? Colors.white : Colors.black,
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                'Choose job type',
                style: TextStyles.black15SemiBold.copyWith(
                  color: settingsProviders.isDark ? Colors.white : Colors.black,
                ),
              ),
              SizedBox(height: 16.h),

              Column(
                children: [
                  RadioListTile(
                    activeColor: kColors[5],
                    fillColor: MaterialStateProperty.all(kColors[5]),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                    title: Text(
                      'Freelancing job on platform',
                      style: TextStyles.black12SemiBold.copyWith(
                        color:
                            settingsProviders.isDark
                                ? Colors.white
                                : Colors.black,
                      ),
                    ),
                    value: 'platform',
                    groupValue: jobType,
                    onChanged: (value) {
                      setState(() {
                        jobType = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    activeColor: kColors[5],
                    fillColor: MaterialStateProperty.all(kColors[5]),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                    title: Text(
                      'Freelancing job with direct contact',
                      style: TextStyles.black12SemiBold.copyWith(
                        color:
                            settingsProviders.isDark
                                ? Colors.white
                                : Colors.black,
                      ),
                    ),
                    value: 'directContact',
                    groupValue: jobType,
                    onChanged: (value) {
                      setState(() {
                        jobType = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    activeColor: kColors[5],
                    fillColor: MaterialStateProperty.all(kColors[5]),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                    title: Text(
                      'Remote monthly job',
                      style: TextStyles.black12SemiBold.copyWith(
                        color:
                            settingsProviders.isDark
                                ? Colors.white
                                : Colors.black,
                      ),
                    ),
                    value: 'remoteMonthly',
                    groupValue: jobType,
                    onChanged: (value) {
                      setState(() {
                        jobType = value.toString();
                      });
                    },
                  ),
                ],
              ),

              SizedBox(height: 24.h),

              Row(
                children: [
                  Expanded(
                    child: CustomButtonWidget(
                      text: "Back",
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          HomeScreen.routeName,
                          (route) => false,
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: CustomButtonWidget(
                      text: "Next",
                      onPressed: _navigateToNextScreen,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 24.h),

              Text(
                'Please select the appropriate type to ensure it is categorized correctly. Here are the options:',
                style: TextStyles.grey12Medium,
              ),
              SizedBox(height: 8.h),

              Text(
                '• Freelancing job on platform: Select this option if the job is posted on freelancing platforms like Mostaql, Khamsat, Upwork, etc. These jobs typically involve working through a third-party site that handles payments and communications.',
                style: TextStyles.grey12Medium,
                softWrap: true,
              ),
              SizedBox(height: 8.h),

              Text(
                '• Freelancing job with direct contact: Choose this if the job comes from your personal network, such as connections on LinkedIn or referrals. These jobs often involve direct communication with the client without a middleman.',
                style: TextStyles.grey12Medium,
                softWrap: true,
              ),
              SizedBox(height: 8.h),

              Text(
                '• Remote monthly job: Use this option for traditional remote positions that offer a monthly salary. These jobs may have structured hours and responsibilities similar to in-office roles.',
                style: TextStyles.grey12Medium,
                softWrap: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
