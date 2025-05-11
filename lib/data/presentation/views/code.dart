import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iti_freelancing_hub/core/utils/images/app_images.dart';
import 'package:iti_freelancing_hub/core/utils/styles.dart';
import 'package:iti_freelancing_hub/data/presentation/views/changeSuccessfully.dart';
import 'package:iti_freelancing_hub/data/presentation/views/newPassword.dart';
import 'package:iti_freelancing_hub/data/presentation/views/signIn.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/CustomButtonWidget.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/footer.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/input_box.dart';
 
class CodeScreen extends StatelessWidget {
  static const routeName = '/code-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(35.0),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 170),
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
             Container(
              width: double.infinity,
              child: Text('Enter Verification Code', style: TextStyles.black20SemiBold, textAlign: TextAlign.start,),),
            const SizedBox(height: 15),
             Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        6,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: const InputBox(),
        ),
      ),
    ),
                const SizedBox(height: 15),

       Text('We have sent an email to your registered email address with a verification code.', style: TextStyles.grey12Medium,),

            const SizedBox(height: 15),
            CustomButtonWidget(
              text: 'Verify Code',
              onPressed: () {
 Navigator.push(context,   MaterialPageRoute(
                            builder: (context) =>   NewPassword(),
                          ));              },
            ),
            const SizedBox(height: 16),
  CustomButtonWidget(
               text: 'Resend Code',
              onPressed: () {

               },
            ),

            const SizedBox(height: 10),
              Container(
                width: double.infinity,
                child: RichText(
                      textAlign: TextAlign.end,
                      text: TextSpan(
                        text: 'Back to Sign In Page',
                        style: TextStyles.red15SemiBold,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(context,   MaterialPageRoute(
                              builder: (context) => const SignIn(),
                            ));
                           },
                      ),
                    ),
              ),
                  const SizedBox(height: 120),

        Footer(),
          ],
        ),
      ),
    );
  }
}
