import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iti_freelancing_hub/constants.dart';
import 'package:iti_freelancing_hub/core/providers/setting_provider.dart';
import 'package:iti_freelancing_hub/core/utils/images/app_images.dart';
import 'package:iti_freelancing_hub/core/utils/mainscafold.dart';
import 'package:iti_freelancing_hub/core/utils/styles.dart';
import 'package:iti_freelancing_hub/data/presentation/views/chat.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/custom_Buttom.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  static const routeName = '/chat-screen';
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    final settingsProviders = Provider.of<SettingsProvider>(context);

    return MainScaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16, top: 16),

            child: Row(
              children: [
                SizedBox(height: 24.h),

                Text(
                  'Chat with Us!',
                  style: TextStyles.black12SemiBold.copyWith(fontSize: 16),
                ),
              ],
            ),
          ),
          SizedBox(height: 48.h),
          SvgPicture.asset(Assets.assetsImagesMessage),
          SizedBox(height: 24.h),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "If you have any questions or encounter any issues, you’re in the right place.",
                  style: TextStyles.black20SemiBold.copyWith(
                    color:
                        settingsProviders.isDark ? Colors.white : Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.h),
                Text(
                  "Welcome! If you have any questions or problems, feel free to chat with our admin here. Just type your message below, and we’ll get back to you as soon as possible. We’re here to help!",
                  style: TextStyles.grey12Medium,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24.h),
                CustomButtoms(
                  text: 'Get Started',
                  color: settingsProviders.isDark ? kColors[0] : Colors.black,
                  textcolor: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => (Chat())),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
