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
import 'package:iti_freelancing_hub/generated/l10n.dart'; // Added for localization

class ChatScreen extends StatefulWidget {
  static const routeName = '/chat-screen';
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    final settingsProviders = Provider.of<SettingsProvider>(context);
    final s = S.of(context); // Added for localization

    return MainScaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Row(
              children: [
                SizedBox(height: 24.h),
                Text(
                  s.chatScreenTitle, // Localized title
                  style: TextStyles.black12SemiBold.copyWith(
                    fontSize: 16,
                    color: settingsProviders.isDark ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 48.h),
          Expanded( // Added Expanded to match the first code
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(Assets.assetsImagesMessage),
                SizedBox(height: 24.h),
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        s.chatScreenMainMessage, // Localized main message
                        style: TextStyles.black20SemiBold.copyWith(
                          color: settingsProviders.isDark ? Colors.white : Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        s.chatWelcomeMessage, // Localized welcome message
                        style: TextStyles.grey12Medium.copyWith(
                          color: settingsProviders.isDark ? Colors.grey[400] : Colors.grey[700],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 24.h),
                      CustomButtoms(
                        text: s.getStartedButton, // Localized button text
                        color: settingsProviders.isDark ? kColors[0] : Colors.black,
                        textcolor: Colors.white,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Chat()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}