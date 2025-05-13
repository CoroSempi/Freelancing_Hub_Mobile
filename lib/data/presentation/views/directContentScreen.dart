import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iti_freelancing_hub/core/utils/images/app_images.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/CustomButtonWidget.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/form-field.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/formFieldWithDropdown.dart';

class DirectContentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(Assets.assetdirect),
            SizedBox(height: 16.h),

            FormFieldWidget(
              title: 'Job Title',
              subtitle: 'Enter the title of the job',
              hintText: 'Enter the title of the job',
            ),
            SizedBox(height: 16.h),

            FormFieldWidget(
              title: 'Client Name',
              subtitle: 'Enter the client\'s name',
              hintText: 'Enter the client\'s name',
            ),

            SizedBox(height: 16.h),

            Row(
              children: [
                Expanded(
                  child: FormFieldWidget(
                    title: 'Start Date',
                    subtitle: 'Enter the start date',
                    hintText: 'DD/MM/YYYY',
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: FormFieldWidget(
                    title: 'End Date',
                    subtitle: 'Enter the end date',
                    hintText: 'DD/MM/YYYY',
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),

            Row(
              children: [
                Expanded(
                  child: FormFieldWidget(
                    title: 'Budget',
                    subtitle: 'Enter the budget',
                    hintText: 'Enter the budget',
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: FormFieldWidget(
                    title: 'Currency',
                    subtitle: 'Enter the currency',
                    hintText: 'Enter the currency',
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),

            FormFieldWithDropdown(
              title: 'Team members ',
              subtitle: '(optional )',
              dropDownText: 'dropDownText',
            ),
            FormFieldWidget(
              title: 'Client Name ',
              subtitle: '(Required)',
              hintText: '',
            ),

            FormFieldWidget(
              title: 'Client Contact ',
              subtitle: '(Required)',
              hintText: '',
            ),

            SizedBox(height: 24.h),
            FormFieldWithDropdown(
              title: 'Client Country ',
              subtitle: '(Required)',
              dropDownText: 'dropDownText',
            ),

            SizedBox(height: 16.h),

            FormFieldWithDropdown(
              title: 'Platform',
              subtitle: '(Required)',
              dropDownText: 'dropDownText',
            ),

            FormFieldWidget(
              title: 'Proof of Work',
              subtitle: '(Required)',
              hintText:
                  "Prepare a PDF document that includes screenshots of chats between you and the client, samples of the work completed, and proof of payment or invoices. Once you've compiled everything into a single PDF, upload it to Google Drive, copy the link, and paste it in here. Make sure the link is set to Anyone with the link can view so that admin can access it.",
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.red,
                      side: const BorderSide(color: Colors.red),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Back'),
                  ),
                ),
                Spacer(),
                Expanded(
                  child: CustomButtonWidget(text: "Submit", onPressed: () {}),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
