import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iti_freelancing_hub/core/utils/images/app_images.dart';
import 'package:iti_freelancing_hub/core/utils/styles.dart';
import 'package:iti_freelancing_hub/data/presentation/views/changeSuccessfully.dart';
import 'package:iti_freelancing_hub/data/presentation/views/submitSuccessfully.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/CustomButtonWidget.dart';
 import 'package:iti_freelancing_hub/data/presentation/widgets/CustomTextField.dart';

class NewPassword extends StatelessWidget {
  static const routeName = '/new-password';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(35.0),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 200),
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    Assets.assetsImagesIti,
                    width: 93,
                    height: 150,
                  ),
                  SvgPicture.asset(
                    Assets.assetsImagesFreelancingHub,
                    width: 166,
                    height: 30,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            CustomTextFields(
              hint: 'New Password',
              maxLines: 1,
            ),
            const SizedBox(height: 16),
            CustomTextFields(
              hint: 'Confirm Password',
              maxLines: 1,
            ),
            const SizedBox(height: 24),
            CustomButtonWidget(
              text: 'Change Password',
              onPressed: () {
showChangeSuccessfullyDialog(context);

               },
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              child: RichText(
                textAlign: TextAlign.end,
                text: TextSpan(
                  text: 'Back to Sign In Page',
                  style: TextStyles.red15SemiBold,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // Action for Back to Sign In Page
                    },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
