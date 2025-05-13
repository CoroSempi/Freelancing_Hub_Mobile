import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iti_freelancing_hub/constants.dart';
import 'package:iti_freelancing_hub/core/utils/styles.dart';
import 'package:iti_freelancing_hub/data/presentation/views/homeScreen.dart';

class CustomAppBar extends StatelessWidget {
  final String? title;
  final String? backText;
  final VoidCallback? onBackPressed;
  final bool showPendingButton;

  const CustomAppBar({
    Key? key,
    this.title,
    this.backText,
    this.onBackPressed,
    this.showPendingButton = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   border: Border(bottom: BorderSide(color: Colors.grey, width: 1.0)),
      // ),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back_ios, color: kColors[0]),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
                (Route<dynamic> route) => false,
              );
            },
          ),

          if (backText != null) ...[
            Text(backText!, style: TextStyles.red15SemiBold),
            SizedBox(width: 4.w),
          ],
          SizedBox(width: 10.w),
          if (title != null) ...[
            Text(title!, style: TextStyles.black12SemiBold),
            SizedBox(width: 5.w),
          ],

          if (showPendingButton) ...[
            Spacer(),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[300],
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Pending',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
