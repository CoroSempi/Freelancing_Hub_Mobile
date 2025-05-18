import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iti_freelancing_hub/constants.dart';
import 'package:iti_freelancing_hub/core/utils/images/app_images.dart';
import 'package:iti_freelancing_hub/core/utils/styles.dart';

class AboutItScreen extends StatelessWidget {
  static const routeName = '/about-it-screen';

  @override
  Widget build(BuildContext context) {
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
              Text('Back', style: TextStyle(color: kColors[0], fontSize: 14)),
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
              'What is the ITI Freelancing Hub?',
              style: TextStyles.red15SemiBold.copyWith(fontSize: 18),
            ),
            SizedBox(height: 8.h),
            Text(
              'The ITI Freelancing Hub is designed specifically for students who have secured their own freelancing jobs. This platform allows students to upload the details of their jobs for administrative approval. Once approved, these opportunities contribute to their graduation requirements.',
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
              'How to Use the Platform',
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
                      'Registration and Sign In',
                      style: TextStyles.red15SemiBold.copyWith(fontSize: 18),
                    ),

                    SizedBox(height: 8),
                    Text(
                      '• Your admin will upload your email to the system. Once registered, you can log in to your account.',
                      style: TextStyles.grey12Medium,
                    ),
                    SizedBox(height: 8),
                    Text(
                      '• Use your registered email to access the platform. If it’s your first time, you can reset your password as needed.',
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
