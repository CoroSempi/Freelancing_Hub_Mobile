import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iti_freelancing_hub/constants.dart';
import 'package:iti_freelancing_hub/core/utils/images/app_images.dart';
import 'package:iti_freelancing_hub/core/utils/styles.dart';
import 'package:iti_freelancing_hub/generated/l10n.dart'; // import localization

class AboutItScreen extends StatelessWidget {
  static const routeName = '/about-it-screen';

  @override
  Widget build(BuildContext context) {
    final s = S.of(context); // localization instance

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Row(
            children: [
              SizedBox(width: 8),
              Icon(Icons.arrow_back_ios, color: kColors[0]),
              SizedBox(width: 4),
              Text(s.settings_back, style: TextStyle(color: kColors[0], fontSize: 14)),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              s.learnMore_title,
              style: TextStyles.red15SemiBold.copyWith(fontSize: 18),
            ),
            SizedBox(height: 8.h),
            Text(
              s.learnMore_subtitle,
              style: TextStyles.grey12Medium,
            ),
            const SizedBox(height: 16),
            Center(
              child: SvgPicture.asset(
                Assets.assetsImagesBoy,
                width: 200,
                height: 200,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              s.learnMore_howToUse,
              style: TextStyles.red15SemiBold.copyWith(fontSize: 18),
            ),
            const SizedBox(height: 16),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      s.learnMore_slides_1_title,
                      style: TextStyles.red15SemiBold.copyWith(fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    Text(
                      s.learnMore_slides_1_content_1,
                      style: TextStyles.grey12Medium,
                    ),
                    SizedBox(height: 8),
                    Text(
                      s.learnMore_slides_1_content_2,
                      style: TextStyles.grey12Medium,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
