import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iti_freelancing_hub/constants.dart';
import 'package:iti_freelancing_hub/core/utils/mainscafold.dart';
import 'package:iti_freelancing_hub/core/utils/styles.dart';
import 'package:iti_freelancing_hub/data/presentation/views/directContentScreen.dart';
import 'package:iti_freelancing_hub/data/presentation/views/homeScreen.dart';
import 'package:iti_freelancing_hub/data/presentation/views/platFormScreen.dart';
import 'package:iti_freelancing_hub/data/presentation/views/remoteMonthlyJob.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/CustomButtonWidget.dart';
// Add import for localization
import 'package:iti_freelancing_hub/generated/l10n.dart';

class AddNewJobScreen extends StatefulWidget {
  static const routeName = '/add-task';

  const AddNewJobScreen({super.key});

  @override
  State<AddNewJobScreen> createState() => _AddNewJobScreenState();
}

class _AddNewJobScreenState extends State<AddNewJobScreen> {
  String? _selectedJobType;

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);  

    return MainScaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(s.addNewJobTitle, style: TextStyles.black20SemiBold),
            Text(s.chooseJobType, style: TextStyles.black15SemiBold),
            SizedBox(height: 16.h),
            Column(
              children: [
                RadioListTile(
                  activeColor: kColors[0],
                  fillColor: WidgetStateProperty.all(kColors[0]),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 0,
                  ),
                  title: Text(
                    s.jobTypePlatform,  
                    style: TextStyles.black12SemiBold,
                  ),
                  value: 'platform',
                  groupValue: _selectedJobType,
                  onChanged: (value) {
                    setState(() {
                      _selectedJobType = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  activeColor: kColors[0],
                  fillColor: WidgetStateProperty.all(kColors[0]),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 0,
                  ),
                  title: Text(
                    s.jobTypeDirectContact, 
                    style: TextStyles.black12SemiBold,
                  ),
                  value: 'directContact',
                  groupValue: _selectedJobType,
                  onChanged: (value) {
                    setState(() {
                      _selectedJobType = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  activeColor: kColors[0],
                  fillColor: WidgetStateProperty.all(kColors[0]),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 0,
                  ),
                  title: Text(
                    s.jobTypeRemoteMonthly,  
                    style: TextStyles.black12SemiBold,
                  ),
                  value: 'remoteMonthly',
                  groupValue: _selectedJobType,
                  onChanged: (value) {
                    setState(() {
                      _selectedJobType = value as String?;
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
                      Navigator.pop(context);  
                    },
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: CustomButtonWidget(
                    text: s.nextButton,  
                    onPressed: () {
                      if (_selectedJobType != null) {
                        switch (_selectedJobType) {
                          case 'platform':
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => PlatformScreen()),
                            );
                            break;
                          case 'directContact':
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => DirectContentScreen()),
                            );
                            break;
                          case 'remoteMonthly':
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => Remotemonthlyjob()),
                            );
                            break;
                        }
                      }
                    },
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
            SizedBox(height: 8.h),
          ],
        ),
      ),
    );
  }
}