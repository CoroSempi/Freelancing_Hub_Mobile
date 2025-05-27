import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iti_freelancing_hub/core/utils/images/app_images.dart';
import 'package:iti_freelancing_hub/core/utils/mainscafold.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/CustomButtonWidget.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/form-field.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/formFieldWithDropdown.dart';
import 'package:iti_freelancing_hub/generated/l10n.dart'; // Added for localization

class Remotemonthlyjob extends StatelessWidget {
  const Remotemonthlyjob({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context); // Added for localization

    return MainScaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(Assets.assetremote),
            SizedBox(height: 16.h),
            FormFieldWidget(
              title: s.jobTitleLabel, // Reused from previous: "jobTitleLabel": "Job Title"
              subtitle: s.enterJobTitleHint, // Reused from previous: "enterJobTitleHint": "Enter the title of the job"
              hintText: s.enterJobTitleHint,
            ),
            SizedBox(height: 16.h),
            FormFieldWidget(
              title: s.clientNameLabel, // Reused from previous: "clientNameLabel": "Client Name"
              subtitle: s.enterClientNameHint, // Reused from previous: "enterClientNameHint": "Enter the client's name"
              hintText: s.enterClientNameHint,
            ),
            SizedBox(height: 16.h),
            FormFieldWidget(
              title: s.startDateLabel, // Reused from previous: "startDateLabel": "Start Date"
              subtitle: s.enterStartDateHint, // Reused from previous: "enterStartDateHint": "Enter the start date"
              hintText: s.dateFormatHint, // Reused from previous: "dateFormatHint": "DD/MM/YYYY"
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Expanded(
                  child: FormFieldWidget(
                    title: s.budgetLabel,
                    subtitle: s.enterBudgetHint,
                    hintText: s.enterBudgetHint,
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: FormFieldWidget(
                    title: s.currencyLabel,
                    subtitle: s.enterCurrencyHint,
                    hintText: s.enterCurrencyHint,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            FormFieldWidget(
              title: s.clientNameLabel,
              subtitle: s.requiredLabel,
              hintText: '',
            ),
            FormFieldWidget(
              title: s.clientContactLabel,
              subtitle: s.requiredLabel,
              hintText: '',
            ),
            SizedBox(height: 24.h),
            FormFieldWithDropdown(
              title: s.clientCountryLabel,
              subtitle: s.requiredLabel,
              dropDownText: s.selectCountryHint,
            ),
            SizedBox(height: 16.h),
            FormFieldWidget(
              title: s.proofOfWorkLabel,
              subtitle: s.requiredLabel,
              hintText: s.proofOfWorkInstructions,
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
                    child: Text(s.backButton),
                  ),
                ),
                Spacer(),
                Expanded(
                  child: CustomButtonWidget(
                    text: s.submitButton,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}