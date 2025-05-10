import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iti_freelancing_hub/constants.dart';
import 'package:iti_freelancing_hub/core/utils/mainscafold.dart';
import 'package:iti_freelancing_hub/core/utils/styles.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/custom_Buttom.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/custom_app_bar.dart';

class ChangeProfile extends StatelessWidget {
  final Widget image;
  final VoidCallback onEdit;
  static const routeName = '/changeprofile';

  const ChangeProfile({super.key, required this.image, required this.onEdit});

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
                Text('Edit My Profile', style: TextStyles.black20SemiBold),
              ],
            ),

            SizedBox(height: 14.h),

            Stack(
              children: [
                ClipOval(
                  child: SizedBox(width: 120, height: 120, child: image),
                ),

                Positioned(
                  bottom: 0,
                  right: 4,
                  child: GestureDetector(
                    onTap: onEdit,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: kColors[0],
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: const Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 24.h),

            Text(
              "Your personal information is based on what you registered during the training. If you need to update any of this information, please contact the admin for assistance.",
              style: TextStyles.grey12Medium,
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 24.h),

            CustomButtoms(
              text: 'Submit',
              color: kColors[1],
              textcolor: kColors[2],
            ),
          ],
        ),
      ),
    );
  }
}
