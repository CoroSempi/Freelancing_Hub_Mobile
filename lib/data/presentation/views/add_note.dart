import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iti_freelancing_hub/constants.dart';
import 'package:iti_freelancing_hub/core/providers/setting_provider.dart';
import 'package:iti_freelancing_hub/core/utils/images/app_images.dart';
import 'package:iti_freelancing_hub/core/utils/mainscafold.dart';
import 'package:iti_freelancing_hub/core/utils/styles.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/custom_app_bar.dart';

import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class AddNote extends StatelessWidget {
  static const routeName = '/notes';

  const AddNote({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsProviders = Provider.of<SettingsProvider>(context);

    return MainScaffold(
      body: Column(
        children: [
          CustomAppBar(
            backText: 'Back',
            onBackPressed: () {},
            showPendingButton: false,
          ),
          settingsProviders.isDark
              ? SvgPicture.asset(Assets.assetdarkNote)
              : SvgPicture.asset(Assets.assetNote),
          SizedBox(height: 8.h),
          _buildLinkRow(
            "ITI Freelancing",
            'https://iti-freelancing-hub.netlify.app/' ?? '',
            settingsProviders,
          ),
        ],
      ),
    );
  }

  Widget _buildLinkRow(
    String title,
    String url,
    SettingsProvider settingsProvider,
  ) {
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: TextStyles.black15Medium.copyWith(
            color: settingsProvider.isDark ? kColors[2] : kColors[1],
          ),
          children: [
            TextSpan(text: '$title: '),
            TextSpan(
              text: 'Open Link',
              style: TextStyle(
                color: settingsProvider.isDark ? kColors[5] : kColors[6],
                fontWeight: FontWeight.bold,
              ),
              recognizer:
                  TapGestureRecognizer()
                    ..onTap = () async {
                      final uri = Uri.tryParse(url);
                      if (uri != null && await canLaunchUrl(uri)) {
                        await launchUrl(
                          uri,
                          mode: LaunchMode.externalApplication,
                        );
                      }
                    },
            ),
          ],
        ),
      ),
    );
  }
}
