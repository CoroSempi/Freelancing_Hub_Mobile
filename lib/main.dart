import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iti_freelancing_hub/core/providers/setting_provider.dart';
import 'package:iti_freelancing_hub/core/providers/thems_provider.dart';
import 'package:iti_freelancing_hub/core/utils/images/app_images.dart';
import 'package:iti_freelancing_hub/core/utils/remote/Dio-Helper.dart';
import 'package:iti_freelancing_hub/data/presentation/manger/cubit/chat/chat_cubit_cubit.dart';
import 'package:iti_freelancing_hub/data/presentation/manger/cubit/login_cubit_cubit.dart';
import 'package:iti_freelancing_hub/data/presentation/views/aboutItScreen.dart';
import 'package:iti_freelancing_hub/data/presentation/views/addNewJob.dart';
import 'package:iti_freelancing_hub/data/presentation/views/details.dart';
import 'package:iti_freelancing_hub/data/presentation/views/notification.dart';
import 'package:provider/provider.dart';
import 'package:iti_freelancing_hub/data/presentation/views/homeScreen.dart';
import 'package:iti_freelancing_hub/data/presentation/views/signIn.dart';
import 'package:iti_freelancing_hub/data/presentation/views/changePassword.dart';
import 'package:iti_freelancing_hub/data/presentation/views/change_profile.dart';
import 'package:iti_freelancing_hub/data/presentation/views/chat.dart';
import 'package:iti_freelancing_hub/data/presentation/views/chats.dart';
import 'package:iti_freelancing_hub/data/presentation/views/setting.dart';

// corosempi@gmail.com
void main() {
  DioHelper.init();
  runApp(
    ChangeNotifierProvider(create: (_) => SettingsProvider(), child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            BlocProvider(create: (context) => LoginCubitCubit()),
            BlocProvider(create: (context) => ChatCubitCubit()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            themeMode:
                settingsProvider.isDark ? ThemeMode.dark : ThemeMode.light,
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            routes: {
              SignIn.routeName: (context) => SignIn(),
              AboutItScreen.routeName: (context) => AboutItScreen(),
              AddNewJobScreen.routeName: (context) => AddNewJobScreen(),
              HomeScreen.routeName: (context) => const HomeScreen(),
              ChatScreen.routeName: (context) => ChatScreen(),
              Chat.routeName: (context) => Chat(),
              SettingsPage.routeName: (context) => SettingsPage(),
              Changepassword.routeName: (context) => Changepassword(),
              JobDetails.routeName: (context) => JobDetails(),
              Notifications.routeName: (context) => Notifications(),
              ChangeProfile.routeName:
                  (context) => ChangeProfile(
                    image: SvgPicture.asset(Assets.assetsavatar),
                    onEdit: () {
                      print("done");
                    },
                  ),
            },
            home: HomeScreen(),
          ),
        );
      },
    );
  }
}
