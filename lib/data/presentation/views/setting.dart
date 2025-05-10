import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iti_freelancing_hub/constants.dart';
import 'package:iti_freelancing_hub/core/providers/setting_provider.dart';
import 'package:iti_freelancing_hub/core/providers/thems_provider.dart';
import 'package:iti_freelancing_hub/core/utils/images/app_images.dart';
import 'package:iti_freelancing_hub/core/utils/mainscafold.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';
import 'package:iti_freelancing_hub/data/presentation/views/changePassword.dart';
import 'package:iti_freelancing_hub/data/presentation/views/change_profile.dart';
import 'package:iti_freelancing_hub/data/presentation/views/chat.dart';
import 'package:iti_freelancing_hub/data/presentation/views/chats.dart';
import 'package:iti_freelancing_hub/data/presentation/views/about_it.dart';
import 'package:iti_freelancing_hub/data/presentation/views/add_task.dart';
import 'package:iti_freelancing_hub/core/utils/styles.dart';

class SettingsPage extends StatefulWidget {
  static const routeName = '/settings';

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    // final themeProvider = Provider.of<ThemeProvider>(context);
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);

    return MainScaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
              backText: 'Back',
              onBackPressed: () {},
              showPendingButton: false,
            ),
            Text(
              'Setting',
              style: TextStyles.black12SemiBold.copyWith(fontSize: 16),
            ),
            SizedBox(height: 16.h),

            // Dark Mode Switch
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Switch(
                      value: settingsProvider.themeMode == ThemeMode.dark,
                      onChanged:
                          (isDark) => settingsProvider.changeTheme(
                            isDark ? ThemeMode.dark : ThemeMode.light,
                          ),
                      activeTrackColor: kColors[0],
                      inactiveTrackColor: kColors[3],
                      activeColor: kColors[2],
                      // inactiveThumbColor: kColors[3],
                    ),
                    SizedBox(width: 8.w),
                    Text("Theme", style: TextStyles.black12SemiBold),
                  ],
                ),
                Text(
                  settingsProvider.isDark ? "Dark" : "Light",
                  style: TextStyles.red15SemiBold,
                ),
              ],
            ),

            SizedBox(height: 16.h),
            Text(
              'Account Setting',
              style: TextStyles.grey12Medium.copyWith(fontSize: 16),
            ),
            const SizedBox(height: 16),
            // Edit Profile
            ListTile(
              leading: Icon(Icons.person_pin, color: kColors[0]),
              title: Text(
                'Edit My Profile',
                style: TextStyles.black20SemiBold.copyWith(fontSize: 14),
              ),
              contentPadding: EdgeInsets.zero,
              onTap: () {
                Navigator.of(
                  context,
                ).pushReplacementNamed(ChangeProfile.routeName);
              },
            ),
            // Change Password
            ListTile(
              leading: SvgPicture.asset(Assets.assetsKey),
              title: Text(
                'Change Password',
                style: TextStyles.black20SemiBold.copyWith(fontSize: 14),
              ),
              contentPadding: EdgeInsets.zero,
              onTap: () {
                Navigator.of(
                  context,
                ).pushReplacementNamed(Changepassword.routeName);
              },
            ),
            SizedBox(height: 16.h),
            // Support Section
            Text(
              'Support',
              style: TextStyles.grey12Medium.copyWith(fontSize: 16),
            ),
            SizedBox(height: 16.h),
            // Chat with Us
            ListTile(
              leading: Icon(Icons.chat, color: kColors[0]),
              title: Text(
                'Chat with us',
                style: TextStyles.black20SemiBold.copyWith(fontSize: 14),
              ),
              contentPadding: EdgeInsets.zero,
              onTap: () {
                Navigator.of(
                  context,
                ).pushReplacementNamed(ChatScreen.routeName);
              },
            ),
            // About ITI Freelancing Hub
            ListTile(
              leading: Icon(Icons.help_outline, color: kColors[0]),
              title: Text(
                'About ITI Freelancing Hub',
                style: TextStyles.black20SemiBold.copyWith(fontSize: 14),
              ),
              contentPadding: EdgeInsets.zero,
              onTap: () {
                Navigator.of(
                  context,
                ).pushReplacementNamed(AboutItScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
