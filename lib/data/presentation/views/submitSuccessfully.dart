import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iti_freelancing_hub/core/utils/images/app_images.dart';
import 'package:iti_freelancing_hub/core/utils/styles.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/CustomButtonWidget.dart';
 void showSubmitSuccessfullyDialog(BuildContext context) {
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
                'Submitted Successfully!',
                style: TextStyles.title,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'Your job has been submitted successfully and will be reviewed by the admin. You will be notified once it has been checked.',
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
                text: 'Back to Home',
                onPressed: () {
                  Navigator.pop(context); 
             
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}
