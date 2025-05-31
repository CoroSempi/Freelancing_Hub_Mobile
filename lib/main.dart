import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iti_freelancing_hub/core/providers/setting_provider.dart';
import 'package:iti_freelancing_hub/core/utils/images/app_images.dart';
import 'package:iti_freelancing_hub/core/utils/remote/Dio-Helper.dart';
import 'package:iti_freelancing_hub/data/local/cashHelper.dart';
import 'package:iti_freelancing_hub/data/presentation/manger/cubit/changmypassword/changmypassword_cubit.dart';
import 'package:iti_freelancing_hub/data/presentation/manger/cubit/chat/chat_cubit_cubit.dart';
import 'package:iti_freelancing_hub/data/presentation/manger/cubit/forget-password/cubit/forgetpassword_cubit.dart';
import 'package:iti_freelancing_hub/data/presentation/manger/cubit/get-all-certificate/cubit/getcertificate_cubit.dart';
import 'package:iti_freelancing_hub/data/presentation/manger/cubit/getAll-jobs/cubit/getalljobs_cubit.dart';
import 'package:iti_freelancing_hub/data/presentation/manger/cubit/getStudent-data/cubit/getstudentdata_cubit.dart';
import 'package:iti_freelancing_hub/data/presentation/manger/cubit/login_cubit_cubit.dart';
import 'package:iti_freelancing_hub/data/presentation/manger/cubit/notification/notification_cubit.dart';
import 'package:iti_freelancing_hub/data/presentation/manger/cubit/profile/profile_cubit.dart';
import 'package:iti_freelancing_hub/data/presentation/manger/cubit/reset-password/cubit/resetpassword_cubit.dart';
import 'package:iti_freelancing_hub/data/presentation/manger/cubit/verify-code/cubit/verifycode_cubit.dart';
import 'package:iti_freelancing_hub/data/presentation/views/aboutItScreen.dart';
import 'package:iti_freelancing_hub/data/presentation/views/addNewJob.dart';
import 'package:iti_freelancing_hub/data/presentation/views/add_note.dart';
import 'package:iti_freelancing_hub/data/presentation/views/changePassword.dart';
import 'package:iti_freelancing_hub/data/presentation/views/change_profile.dart';
import 'package:iti_freelancing_hub/data/presentation/views/chats.dart';
import 'package:iti_freelancing_hub/data/presentation/views/homeScreen.dart';
import 'package:iti_freelancing_hub/data/presentation/views/setting.dart';
import 'package:iti_freelancing_hub/data/presentation/views/signIn.dart';
import 'package:iti_freelancing_hub/generated/l10n.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final savedLang = prefs.getString('locale') ?? 'en';
  CashHelper.init();
  DioHelper.init();

  runApp(
    ChangeNotifierProvider(
      create: (_) => SettingsProvider(initialLocale: Locale(savedLang)),
      child: MyApp(),
    ),
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
            BlocProvider(create: (context) => ProfileCubit()),
            BlocProvider(create: (context) => NotificationsCubit()),
            BlocProvider(create: (context) => ChangePasswordCubit()),
            BlocProvider(create: (context) => ForgetpasswordCubit()),
            BlocProvider(create: (_) => VerifycodeCubit()),
            BlocProvider(create: (context) => ResetpasswordCubit()),
            BlocProvider(
              create: (context) => GetstudentdataCubit()..getStudentData(),
            ),
            BlocProvider(
              create:
                  (context) =>
                      GetalljobsCubit()
                        ..getAllJobs()
                        ..getDataPreference(),
            ),
            BlocProvider(
              create: (context) => GetcertificateCubit()..getCertificate(),
            ),
          ],
          child: MaterialApp(
            locale: settingsProvider.currentLocale,
            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            debugShowCheckedModeBanner: false,
            title: 'ITI Freelancing',
            themeMode: settingsProvider.themeMode,
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            navigatorObservers: [routeObserver],
            onGenerateRoute: (settings) {
              switch (settings.name) {
                case SignIn.routeName:
                  return MaterialPageRoute(builder: (_) => SignIn());
                case SettingsPage.routeName:
                  return MaterialPageRoute(builder: (_) => SettingsPage());
                case Changepassword.routeName:
                  return MaterialPageRoute(builder: (_) => Changepassword());
                case AboutItScreen.routeName:
                  return MaterialPageRoute(builder: (_) => AboutItScreen());
                case HomeScreen.routeName:
                  return MaterialPageRoute(builder: (_) => HomeScreen());
                case AddNewJobScreen.routeName:
                  return MaterialPageRoute(builder: (_) => AddNewJobScreen());
                case AddNote.routeName:
                  return MaterialPageRoute(builder: (_) => AddNote());
                case ChangeProfile.routeName:
                  final args = settings.arguments as Map<String, dynamic>?;
                  final userId = args?['userId'] ?? '';
                  return MaterialPageRoute(
                    builder:
                        (_) => ChangeProfile(
                          userId: userId,
                          image: SvgPicture.asset(Assets.assetsavatar),
                        ),
                  );
                case ChatScreen.routeName:
                  return MaterialPageRoute(builder: (_) => ChatScreen());
                default:
                  return MaterialPageRoute(builder: (_) => SignIn());
              }
            },
            home: SignIn(),
          ),
        );
      },
    );
  }
}
