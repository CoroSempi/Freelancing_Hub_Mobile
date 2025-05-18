import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iti_freelancing_hub/constants.dart';
import 'package:iti_freelancing_hub/core/providers/setting_provider.dart';
import 'package:iti_freelancing_hub/core/utils/styles.dart';
import 'package:provider/provider.dart';

class Comments extends StatelessWidget {
  final String content;
  final bool seen;
  final VoidCallback onTap;

  const Comments({
    super.key,
    required this.content,
    required this.seen,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final settingsProviders = Provider.of<SettingsProvider>(context);
    final isDark = settingsProviders.isDark;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color:
              seen
                  ? (isDark
                      ? Color.fromARGB(255, 28, 23, 23)
                      : Color(0xFFFFD1DC))
                  : (isDark
                      ? Color.fromARGB(255, 70, 39, 39)
                      : Color(0xFFCCCCCC)),

          border: Border.all(color: Colors.grey, width: 1.0),
        ),
        padding: EdgeInsets.all(8.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '🎉 Congratulations!',
              style: TextStyles.red15SemiBold.copyWith(
                color: settingsProviders.isDark ? Colors.white : kColors[0],
              ),
            ),
            SizedBox(height: 6.h),
            Text(content, style: TextStyles.grey12Medium),
          ],
        ),
      ),
    );
  }
}
