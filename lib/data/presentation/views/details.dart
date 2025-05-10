import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iti_freelancing_hub/constants.dart';
import 'package:iti_freelancing_hub/core/utils/images/app_images.dart';
import 'package:iti_freelancing_hub/core/utils/mainscafold.dart';
import 'package:iti_freelancing_hub/core/utils/styles.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/custom_Buttom.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/custom_app_bar.dart';

class JobDetails extends StatelessWidget {
  const JobDetails({super.key});
  static const routeName = '/details';

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
              backText: 'Back',
              onBackPressed: () {},
              showPendingButton: true,
            ),
            SizedBox(height: 4.h),
            Text(
              'Website Development for Local Bakery',
              style: TextStyles.black20SemiBold,
            ),
            SizedBox(height: 8.h),
            Text('platform job - Mostaql ', style: TextStyles.red15SemiBold),
            SizedBox(height: 8.h),
            Text(
              'Develop a responsive website for a local bakery that showcases its products and allows customers to place orders online. The site should include an online menu, a contact page, and a blog section for updates. The design must reflect the bakery\'s branding and be user-friendly.',
              style: const TextStyle(fontSize: 14, color: Colors.black87),
              softWrap: true,
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Text('Contributors : ', style: TextStyles.black12SemiBold),
                Text('Seif El-islam', style: TextStyles.grey12Medium),
              ],
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                SvgPicture.asset(Assets.assetdate),
                SizedBox(width: 5.w),
                Text('Start : ', style: TextStyles.black12SemiBold),
                SizedBox(width: 5.w),
                Text('25/9/2001', style: TextStyles.grey12Medium),
              ],
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                SvgPicture.asset(Assets.assetdate),
                SizedBox(width: 5.w),
                Text('Completion : ', style: TextStyles.black12SemiBold),
                SizedBox(width: 5.w),
                Text('25/9/2001', style: TextStyles.grey12Medium),
              ],
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                SvgPicture.asset(Assets.assetsusd),
                SizedBox(width: 5.w),
                Text('80', style: TextStyles.black12SemiBold),
                SizedBox(width: 10.w),
                SvgPicture.asset(Assets.assetsegp),
                SizedBox(width: 5.w),
                Text('4,000', style: TextStyles.grey12Medium),
              ],
            ),
            SizedBox(height: 16.h),
            Text(
              'Comments',
              style: TextStyles.black20SemiBold.copyWith(fontSize: 20),
            ),
            SizedBox(height: 4.h),
            Text(
              'No Comments Yet',
              style: TextStyles.grey12Medium.copyWith(fontSize: 12),
            ),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(
                            'Job Deletion Confirmation',
                            style: TextStyles.black12SemiBold.copyWith(
                              fontSize: 16,
                            ),
                          ),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Are you sure you want to delete this job? This action cannot be undone, and all associated data will be permanently removed.",
                                style: TextStyles.black20SemiBold.copyWith(
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(height: 4),
                              SvgPicture.asset(Assets.assetconfitm, height: 80),
                            ],
                          ),
                          actions: [
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  print('Deleted!');
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Delete is completed',
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
                                  'Confirm',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.red,
                    side: const BorderSide(color: Colors.red),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Delete'),
                ),
                SizedBox(width: 10.w),
                ElevatedButton(
                  onPressed: () {
                    print('Edit Pressed');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kColors[1],
                    foregroundColor: kColors[2],
                    side: BorderSide(color: kColors[1]),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Edite'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
