import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iti_freelancing_hub/core/utils/mainscafold.dart';
import 'package:iti_freelancing_hub/core/utils/styles.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/Comment.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/chat_buble.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/custom_app_bar.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});
  static const routeName = '/notifications';

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      body: Column(
        children: [
          CustomAppBar(backText: "Back"),
          SizedBox(height: 8.h),
          Text('Notifications', style: TextStyles.black12SemiBold),
          SizedBox(height: 8.h),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Comments();
              },
            ),
          ),
        ],
      ),
    );
  }
}
