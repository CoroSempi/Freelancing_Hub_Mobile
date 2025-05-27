import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Fixed import
import 'package:iti_freelancing_hub/constants.dart';
import 'package:iti_freelancing_hub/core/providers/setting_provider.dart';
import 'package:iti_freelancing_hub/core/utils/images/app_images.dart';
import 'package:iti_freelancing_hub/core/utils/mainscafold.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/custom_app_bar.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/CustomButtonWidget.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/form-field.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/formFieldWithDropdown.dart';
import 'package:iti_freelancing_hub/generated/l10n.dart';
import 'package:provider/provider.dart';

class PlatformScreen extends StatelessWidget {
  const PlatformScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(context); // Added for theme support
    final s = S.of(context); // Added for localization

    return MainScaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
              backText: s.backButton, // Reused from previous: "backButton": "Back"
              onBackPressed: () => Navigator.pop(context), // Added onBackPressed
              showPendingButton: false,
            ),
            SizedBox(height: 16.h),
            SvgPicture.asset(Assets.assetplatform),
            SizedBox(height: 16.h),
            FormFieldWidget(
              title: s.jobTitleLabel,
              subtitle: '${s.enterJobTitleHint} ${s.requiredLabel}',
              hintText: s.enterJobTitleHint,
            ),
            SizedBox(height: 16.h),
            FormFieldWidget(
              title: s.clientNameLabel,
              subtitle: '${s.enterClientNameHint} ${s.requiredLabel}',
              hintText: s.enterClientNameHint,
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Expanded(
                  child: FormFieldWidget(
                    title: s.startDateLabel,
                    subtitle: s.enterStartDateHint,
                    hintText: s.dateFormatHint,
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: FormFieldWidget(
                    title: s.endDateLabel,
                    subtitle: s.enterEndDateHint,
                    hintText: s.dateFormatHint,
                  ),
                ),
              ],
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
            FormFieldWithDropdown(
              title: s.teamMembersLabel, // Reused from previous: "teamMembersLabel": "Team members"
              subtitle: s.optionalLabel, // Reused: "optionalLabel": "(optional)"
              dropDownText: s.selectTeamMembersHint, // Reused: "selectTeamMembersHint": "Select team members" (Add options list in widget)
            ),
            // Removed duplicate Client Name field
            SizedBox(height: 24.h),
            FormFieldWithDropdown(
              title: s.clientCountryLabel, // Reused from previous: "clientCountryLabel": "Client Country"
              subtitle: s.requiredLabel, // Reused: "requiredLabel": "(Required)"
              dropDownText: s.selectTeamMembersHint, // Reused: "selectTeamMembersHint" (Add country options list in widget)
            ),
            SizedBox(height: 16.h),
            FormFieldWithDropdown(
              title: s.platformLabel, // Reused from previous: "platformLabel": "Platform"
              subtitle: s.requiredLabel, // Reused: "requiredLabel": "(Required)"
              dropDownText: s.selectTeamMembersHint, // Reused: "selectTeamMembersHint" (Add platform options list in widget)
            ),
            FormFieldWidget(
              title: s.clientProfileLabel, // New key needed: "clientProfileLabel": "Client Profile on The Platform"
              subtitle: s.requiredLabel, // Reused: "requiredLabel": "(Required)"
              hintText: s.clientProfileHint, // New key needed: "clientProfileHint": "Ensure to put the amount in USD currency."
            ),
            SizedBox(height: 24.h),
            FormFieldWidget(
              title: s.yourProfileLabel, // New key needed: "yourProfileLabel": "Your Profile on The Platform"
              subtitle: s.requiredLabel, // Reused: "requiredLabel": "(Required)"
              hintText: s.yourProfileHint, // New key needed: "yourProfileHint": "Provide the link to your profile on the chosen platform."
            ),
            SizedBox(height: 24.h),
            FormFieldWidget(
              title: s.proofOfWorkLabel, // Reused from previous: "proofOfWorkLabel": "Proof of Work"
              subtitle: s.requiredLabel, // Reused: "requiredLabel": "(Required)"
              hintText: s.proofOfWorkInstructions, // Reused from previous: "proofOfWorkInstructions": "..."
            ),
            SizedBox(height: 24.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context), // Added navigation
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: settingsProvider.isDark ? Colors.white : Colors.red,
                      side: const BorderSide(color: Colors.red),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(s.backButton), // Reused from previous: "backButton": "Back"
                  ),
                ),
                Spacer(),
                Expanded(
                  child: CustomButtonWidget(
                    text: s.submitButton, // Reused from previous: "submitButton": "Submit"
                    onPressed: () {}, // Add submit logic here
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