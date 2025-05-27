import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
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

class DirectContentScreen extends StatelessWidget {
  const DirectContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(context);
    final s = S.of(context);

    return MainScaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
              backText: s.backButton,
              onBackPressed: () => Navigator.pop(context),
              showPendingButton: false,
            ),
            SizedBox(height: 16.h),
            SvgPicture.asset(Assets.assetdirect),
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
              title: s.teamMembersLabel,
              subtitle: s.optionalLabel,
              dropDownText: s.selectTeamMembersHint,
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
              dropDownText: s.selectTeamMembersHint,
            ),
            SizedBox(height: 16.h),
            FormFieldWithDropdown(
              title: s.platformLabel,
              subtitle: s.requiredLabel,
              dropDownText: s.selectTeamMembersHint,
            ),
            FormFieldWidget(
              title: s.proofOfWorkLabel,
              subtitle: s.requiredLabel,
              hintText: s.proofOfWorkInstructions,
            ),
            SizedBox(height: 24.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: settingsProvider.isDark ? Colors.white : Colors.red,
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