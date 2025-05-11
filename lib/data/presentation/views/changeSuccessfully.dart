import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iti_freelancing_hub/core/utils/images/app_images.dart';
import 'package:iti_freelancing_hub/core/utils/styles.dart';
import 'package:iti_freelancing_hub/data/presentation/views/signIn.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/CustomButtonWidget.dart';
 void showChangeSuccessfullyDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false, 
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Changed Successfully!',
                style: TextStyles.title,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'Your password has been changed successfully. You can now sign in using your new password.',
                style: TextStyles.grey12Medium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              SvgPicture.asset(
                Assets.assetsImagesTrue,
                width: 120,
                height: 120,
              ),
              const SizedBox(height: 24),
              CustomButtonWidget(
                text: 'Sign In',
                onPressed: () {
                  Navigator.pop(context); // يغلق الديالوج
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignIn()),
                  );
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}
