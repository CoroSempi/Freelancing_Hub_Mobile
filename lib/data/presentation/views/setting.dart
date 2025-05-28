import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iti_freelancing_hub/constants.dart';
import 'package:iti_freelancing_hub/core/providers/setting_provider.dart';
import 'package:iti_freelancing_hub/core/providers/thems_provider.dart';
import 'package:iti_freelancing_hub/core/utils/images/app_images.dart';
import 'package:iti_freelancing_hub/core/utils/mainscafold.dart';
import 'package:iti_freelancing_hub/data/presentation/manger/cubit/getStudent-data/cubit/getstudentdata_cubit.dart';
import 'package:iti_freelancing_hub/data/presentation/manger/cubit/login_cubit_cubit.dart';
import 'package:iti_freelancing_hub/data/presentation/views/aboutItScreen.dart';
import 'package:iti_freelancing_hub/data/presentation/views/signIn.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';
import 'package:iti_freelancing_hub/data/presentation/views/changePassword.dart';
import 'package:iti_freelancing_hub/data/presentation/views/change_profile.dart';
import 'package:iti_freelancing_hub/data/presentation/views/chat.dart';
import 'package:iti_freelancing_hub/data/presentation/views/chats.dart';
import 'package:iti_freelancing_hub/core/utils/styles.dart';
// Add import for localization
import 'package:iti_freelancing_hub/generated/l10n.dart';

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
    final settingsProviders = Provider.of<SettingsProvider>(context);
    final s = S.of(context);  

    return MainScaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
              backText: s.settings_back,
              onBackPressed: () {},
              showPendingButton: false,
            ),
            Text(
              s.settings_title,
              style: TextStyles.black12SemiBold.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: settingsProviders.isDark ? Colors.white : Colors.black,
              ),
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
                    ),
                    SizedBox(width: 8.w),
                  
                    Text(
                      s.settings_theme,
                      style: TextStyles.black12SemiBold.copyWith(
                        color: settingsProviders.isDark ? Colors.white : Colors.black,
                      ),
                    ),
                  ],
                ),

                Row(children: [
  Switch(
                      value: settingsProvider.currentLocale.languageCode == 'ar',
                      onChanged: (isArabic) {
                        settingsProvider.changeLocale(
                          isArabic ? const Locale('ar') : const Locale('en'),
                        );
                      },
                      activeTrackColor: kColors[0],
                      inactiveTrackColor: kColors[3],
                      activeColor: kColors[2],
                    ),
                    SizedBox(width: 8.w),

                    Text(
                      s.settings_language,
                      style: TextStyles.black12SemiBold.copyWith(
                        color: settingsProviders.isDark ? Colors.white : Colors.black,
                      ),
                    ),
                ],) , 

                Text(
                  settingsProvider.isDark ? s.DarkMode : s.LightMode,
                  style: TextStyles.red15SemiBold.copyWith(
                    color: settingsProviders.isDark ? kColors[5] : kColors[0],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Text(
              s.settings_subTitle2,
              style: TextStyles.grey12Medium.copyWith(
                fontSize: 16,
                fontFamily: Localizations.localeOf(context).languageCode == 'ar' ? 'shamelfabily' : null,
              ),
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.person_pin, color: kColors[0]),
              title: Text(
                s.settings_editMyProfile,
                style: TextStyles.black20SemiBold.copyWith(
                  fontSize: 14,
                  color: settingsProviders.isDark ? Colors.white : Colors.black,
                  fontFamily: Localizations.localeOf(context).languageCode == 'ar' ? 'shamelfabilyBold' : null,
                ),
              ),
              contentPadding: EdgeInsets.zero,
              onTap: () async {
                final loginCubit = context.read<LoginCubitCubit>();
                final userId = loginCubit.user?.studentData.id;

                if (userId != null) {
                  final result = await Navigator.of(context).pushNamed(
                    ChangeProfile.routeName,
                    arguments: {'userId': userId},
                  );

                  if (result == true) {
                    context.read<GetstudentdataCubit>().getStudentData();
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("User ID not available")),
                  );
                }
              },
            ),
            // Change Password
            ListTile(
              leading: SvgPicture.asset(Assets.assetsKey),
              title: Text(
                s.settings_changePassword,
                style: TextStyles.black20SemiBold.copyWith(
                  fontSize: 14,
                  color: settingsProviders.isDark ? Colors.white : Colors.black,
                ),
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
              s.settings_subTitle3,
              style: TextStyles.grey12Medium.copyWith(fontSize: 16),
            ),
            SizedBox(height: 16.h),
            // Chat with Us
            ListTile(
              leading: Icon(Icons.chat, color: kColors[0]),
              title: Text(
                s.settings_chat,
                style: TextStyles.black20SemiBold.copyWith(
                  fontSize: 14,
                  color: settingsProviders.isDark ? Colors.white : Colors.black,
                ),
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
                s.settings_about,
                style: TextStyles.black20SemiBold.copyWith(
                  fontSize: 14,
                  color: settingsProviders.isDark ? Colors.white : Colors.black,
                ),
              ),
              contentPadding: EdgeInsets.zero,
              onTap: () {
                Navigator.of(context).pushNamed(AboutItScreen.routeName);
              },
            ),

            ListTile(
              leading: Icon(Icons.logout, color: kColors[0]),
              title: Text(
                s.header_signOut,
                style: TextStyles.black20SemiBold.copyWith(
                  fontSize: 14,
                  color: settingsProviders.isDark ? Colors.white : Colors.black,
                ),
              ),
              contentPadding: EdgeInsets.zero,
              onTap: () async {
                await context.read<LoginCubitCubit>().logout();

                Navigator.pushNamedAndRemoveUntil(
                  context,
                  SignIn.routeName,
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}