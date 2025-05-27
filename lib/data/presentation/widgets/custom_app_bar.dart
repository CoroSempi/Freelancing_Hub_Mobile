import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iti_freelancing_hub/constants.dart';
import 'package:iti_freelancing_hub/core/providers/setting_provider.dart';
import 'package:iti_freelancing_hub/core/utils/styles.dart';
import 'package:iti_freelancing_hub/data/presentation/views/homeScreen.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget {
  final String? title;
  final String? backText;
  final VoidCallback? onBackPressed;
  final bool showPendingButton;
  final String? statusText;  
final Color? color;
  const CustomAppBar({
    super.key,
    this.title,
    this.backText,
    this.onBackPressed,
    this.showPendingButton = false,
    this.statusText,   
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final settingsProviders = Provider.of<SettingsProvider>(context);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
                (Route<dynamic> route) => false,
              );
            },
            child: Row(
              children: [
                Icon(Icons.arrow_back_ios, color: kColors[5], size: 20),
                if (backText != null)
                  Text(
                    backText!,
                    style: TextStyles.red15SemiBold.copyWith(color: kColors[5]),
                  ),
              ],
            ),
          ),

          SizedBox(width: 10.w),

          if (title != null)
            Text(
              title!,
              style: TextStyles.black12SemiBold.copyWith(
                color: settingsProviders.isDark ? Colors.white : Colors.black,
              ),
            ),

         if (showPendingButton && statusText != null) ...[
  const Spacer(),
  Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(30),
    ),
    child: Text(
      statusText!, 
      style: const TextStyle(color: Colors.black),
    ),
  ),
],

        ],
      ),
    );
  }
}
