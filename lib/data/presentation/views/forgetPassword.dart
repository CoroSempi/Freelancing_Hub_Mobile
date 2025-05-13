import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iti_freelancing_hub/core/utils/images/app_images.dart';
import 'package:iti_freelancing_hub/core/utils/styles.dart';
import 'package:iti_freelancing_hub/data/presentation/views/code.dart';
import 'package:iti_freelancing_hub/data/presentation/views/signIn.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/CustomButtonWidget.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/footer.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/CustomTextField.dart';

class ForgetPassword extends StatelessWidget {
  static const routeName = '/forget-password'; // Corrected routeName

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
            const SizedBox(height: 20),
         
            Container(
              padding: const EdgeInsets.all(16.0),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomTextFields(
                    hint: 'Email Address',
                    maxLines: 1,
                  ),
                  const SizedBox(height: 10),
                
                  Text(
                    "If you've forgotten your password, please enter the email address you registered with in ITI. You will receive a code to reset your password.",
                    style: TextStyles.grey12Medium,
                  ),
                  const SizedBox(height: 16), 
                   CustomButtonWidget(
                    text: 'Send Code',
                    onPressed: () {
                          Navigator.push(context,   MaterialPageRoute(
                            builder: (context) =>   CodeScreen(),
                          ));
                     },
                  ),
                  const SizedBox(height: 16),
                  RichText(
                    textAlign: TextAlign.end,
                    text: TextSpan(
                      text: 'Back to Sign In Page',
                      style: TextStyles.red15SemiBold,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(context,   MaterialPageRoute(
                            builder: (context) => SignIn(),
                          ));
                         },
                    ),
                  ),
                ],
              ),
            ),
                           const SizedBox(height: 150),

        Footer(),
          ],
        ),
      ),
    );
  }
}
