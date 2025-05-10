import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iti_freelancing_hub/constants.dart';
import 'package:iti_freelancing_hub/core/utils/images/app_images.dart';
import 'package:iti_freelancing_hub/core/utils/mainscafold.dart';
import 'package:iti_freelancing_hub/core/utils/styles.dart';
import 'package:iti_freelancing_hub/data/presentation/views/signIn.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/custom_Buttom.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/custom_app_bar.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/draw_item.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/text_field.dart';

class Changepassword extends StatelessWidget {
  const Changepassword({super.key});
  static const routeName = '/password';
  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomAppBar(
              backText: 'Back',
              onBackPressed: () {},
              showPendingButton: false,
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                Text(
                  'Change Password',
                  style: TextStyles.black20SemiBold.copyWith(fontSize: 20),
                ),
              ],
            ),
            SizedBox(height: 25.h),

            Row(
              children: [
                Text(
                  'Your  Password',
                  style: TextStyles.black20SemiBold.copyWith(fontSize: 12),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            CustomTextFiled(
              hittext: 'Password',
              prefixImage: "assets/images/key.svg",
            ),
            SizedBox(height: 16.h),

            Row(
              children: [
                Text(
                  'Your New  Password',
                  style: TextStyles.black20SemiBold.copyWith(fontSize: 12),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            CustomTextFiled(
              hittext: 'Password',
              prefixImage: "assets/images/key.svg",
            ),
            SizedBox(height: 16.h),

            Row(
              children: [
                Text(
                  'Repeat You New Passwrod',
                  style: TextStyles.black20SemiBold.copyWith(fontSize: 12),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            CustomTextFiled(
              hittext: 'Password',
              prefixImage: "assets/images/key.svg",
            ),
            SizedBox(height: 16.h),

            RichText(
              text: TextSpan(
                style: TextStyle(color: Colors.black, fontSize: 15),
                children: [
                  TextSpan(text: 'If you’ve forgotten your password, simply '),
                  TextSpan(
                    text: 'sign out',
                    style: TextStyles.red15SemiBold,
                    recognizer:
                        TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SignIn()),
                            );
                          },
                  ),
                  TextSpan(text: ' and click on'),
                  TextSpan(
                    text: '"Forgot Password?"',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text:
                        ' on the login page to reset it using your registered email address.',
                  ),
                ],
              ),
            ),

            SizedBox(height: 24.h),
            CustomButtoms(
              text: 'Change Password',
              color: kColors[1],
              textcolor: kColors[2],
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(
                        'Changed Successfully!',
                        style: TextStyles.black12SemiBold.copyWith(
                          fontSize: 16,
                        ),
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Your password has been updated. You can now log in with your new password. If you have any issues, feel free to reach out for assistance!",
                            style: TextStyles.black20SemiBold.copyWith(
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 12),
                          SvgPicture.asset(Assets.assetsImagesTrue, height: 80),
                        ],
                      ),
                      actions: [
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Password change confirmed',
                                    textAlign: TextAlign.center,
                                  ),
                                  backgroundColor: kColors[0],
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              padding: EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              'OK',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
