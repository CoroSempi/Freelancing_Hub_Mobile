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
import 'package:iti_freelancing_hub/generated/l10n.dart';

class AddNewJobScreen extends StatefulWidget {
  static const routeName = '/add-task';

  @override
  State<AddNewJobScreen> createState() => _AddNewJobScreenState();
}

class _AddNewJobScreenState extends State<AddNewJobScreen> {
  String? jobType;

  void _navigateToNextScreen() {
    if (jobType == 'platform') {
      Navigator.push(context, MaterialPageRoute(builder: (_) => AddNote()));
    } else if (jobType == 'directContact') {
      Navigator.push(context, MaterialPageRoute(builder: (_) => AddNote()));
    } else if (jobType == 'remoteMonthly') {
      Navigator.push(context, MaterialPageRoute(builder: (_) => Remotemonthlyjob()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text( 'Please select a job type') ));
      
    }
  }

  @override
  Widget build(BuildContext context) {
    final settingsProviders = Provider.of<SettingsProvider>(context);
    final s = S.of(context);

    return MainScaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                s.addNewJobTitle,
                style: TextStyles.black20SemiBold.copyWith(
                  color: settingsProviders.isDark ? Colors.white : Colors.black,
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                s.chooseJobType,
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
                      s.jobTypePlatform,
                      style: TextStyles.black12SemiBold.copyWith(
                        color: settingsProviders.isDark ? Colors.white : Colors.black,
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
                      s.jobTypeDirectContact,
                      style: TextStyles.black12SemiBold.copyWith(
                        color: settingsProviders.isDark ? Colors.white : Colors.black,
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
                      s.jobTypeRemoteMonthly,
                      style: TextStyles.black12SemiBold.copyWith(
                        color: settingsProviders.isDark ? Colors.white : Colors.black,
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
                      text: s.backButton,
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
                      text: s.nextButton,
                      onPressed: _navigateToNextScreen,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              Text(
                s.jobTypeInstruction,
                style: TextStyles.grey12Medium,
              ),
              SizedBox(height: 8.h),
              Text(
                s.jobTypePlatformDescription,
                style: TextStyles.grey12Medium,
                softWrap: true,
              ),
              SizedBox(height: 8.h),
              Text(
                s.jobTypeDirectContactDescription,
                style: TextStyles.grey12Medium,
                softWrap: true,
              ),
              SizedBox(height: 8.h),
              Text(
                s.jobTypeRemoteMonthlyDescription,
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
