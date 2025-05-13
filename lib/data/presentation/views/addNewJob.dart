import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iti_freelancing_hub/constants.dart';
import 'package:iti_freelancing_hub/core/utils/mainscafold.dart';
import 'package:iti_freelancing_hub/core/utils/styles.dart';
import 'package:iti_freelancing_hub/data/presentation/views/directContentScreen.dart';
import 'package:iti_freelancing_hub/data/presentation/views/platFormScreen.dart';
import 'package:iti_freelancing_hub/data/presentation/views/remoteMonthlyJob.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/CustomButtonWidget.dart';

class AddNewJobScreen extends StatelessWidget {
  static const routeName = '/add-task';

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Add New Job', style: TextStyles.black20SemiBold),
            SizedBox(height: 16.h),
            Text('Choose job type', style: TextStyles.black15SemiBold),
            SizedBox(height: 16.h),
            Column(
              children: [
                RadioListTile(
                  activeColor: kColors[0],
                  fillColor: MaterialStateProperty.all(kColors[0]),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 0,
                  ),

                  title: Text(
                    'Freelancing job on platform',
                    style: TextStyles.black12SemiBold,
                  ),
                  value: 'platform',
                  groupValue: 'jobType',
                  onChanged: (value) {
                    // Handle selection
                  },
                ),
                RadioListTile(
                  activeColor: Colors.red,
                  fillColor: MaterialStateProperty.all(Colors.red),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 0,
                  ),

                  title: Text(
                    'Freelancing job with direct contact',
                    style: TextStyles.black12SemiBold,
                  ),
                  value: 'directContact',
                  groupValue: 'jobType',
                  onChanged: (value) {
                    // Handle selection
                  },
                ),
                RadioListTile(
                  activeColor: Colors.red,
                  fillColor: MaterialStateProperty.all(Colors.red),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 0,
                  ),

                  title: Text(
                    'Remote monthly job',
                    style: TextStyles.black12SemiBold,
                  ),
                  value: 'remoteMonthly',
                  groupValue: 'jobType',
                  onChanged: (value) {
                    // Handle selection
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
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: CustomButtonWidget(
                    text: "Next",
                    onPressed:
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => DirectContentScreen(),
                          ),
                        ),
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
            Expanded(
              child: Text(
                '• Freelancing job on platform: Select this option if the job is posted on freelancing platforms like Mostaql, Khamsat, Upwork, etc. These jobs typically involve working through a third-party site that handles payments and communications.',
                style: TextStyles.grey12Medium,
                softWrap: true,
              ),
            ),
            SizedBox(height: 8.h),
            Expanded(
              child: Text(
                '• Freelancing job with direct contact: Choose this if the job comes from your personal network, such as connections on LinkedIn or referrals. These jobs often involve direct communication with the client without a middleman.',
                style: TextStyles.grey12Medium,
                softWrap: true,
              ),
            ),
            SizedBox(height: 8.h),
            Expanded(
              child: Text(
                '• Remote monthly job: Use this option for traditional remote positions that offer a monthly salary. These jobs may have structured hours and responsibilities similar to in-office roles.',
                style: TextStyles.grey12Medium,
                softWrap: true,
              ),
            ),
            SizedBox(height: 8.h),
          ],
        ),
      ),
    );
  }
}
