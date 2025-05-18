import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iti_freelancing_hub/constants.dart';
import 'package:iti_freelancing_hub/core/providers/setting_provider.dart';
import 'package:iti_freelancing_hub/core/utils/images/app_images.dart';
import 'package:iti_freelancing_hub/core/utils/mainscafold.dart';
import 'package:iti_freelancing_hub/core/utils/styles.dart';
import 'package:iti_freelancing_hub/data/presentation/manger/cubit/changmypassword/changmypassword_cubit.dart';
import 'package:iti_freelancing_hub/data/presentation/manger/cubit/changmypassword/changmypassword_state.dart';
import 'package:iti_freelancing_hub/data/presentation/views/setting.dart';
import 'package:iti_freelancing_hub/data/presentation/views/signIn.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/custom_Buttom.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/custom_app_bar.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/text_field.dart';
import 'package:provider/provider.dart';

class Changepassword extends StatefulWidget {
  const Changepassword({super.key});
  static const routeName = '/password';

  @override
  State<Changepassword> createState() => _ChangepasswordState();
}

class _ChangepasswordState extends State<Changepassword> {
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final repeatPasswordController = TextEditingController();

  bool isButtonEnabled = false;
  bool isNewPasswordValid = true;
  bool isRepeatPasswordValid = true;

  @override
  void initState() {
    super.initState();
    oldPasswordController.addListener(_validateForm);
    newPasswordController.addListener(_validateForm);
    repeatPasswordController.addListener(_validateForm);
  }

  void _validateForm() {
    setState(() {
      isNewPasswordValid = newPasswordController.text.length >= 8;
      isRepeatPasswordValid = repeatPasswordController.text.length >= 8;

      isButtonEnabled =
          oldPasswordController.text.isNotEmpty &&
          isNewPasswordValid &&
          isRepeatPasswordValid;
    });
  }

  @override
  void dispose() {
    oldPasswordController.removeListener(_validateForm);
    newPasswordController.removeListener(_validateForm);
    repeatPasswordController.removeListener(_validateForm);

    oldPasswordController.dispose();
    newPasswordController.dispose();
    repeatPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final settingsProviders = Provider.of<SettingsProvider>(context);

    return BlocProvider(
      create: (_) => ChangePasswordCubit(),
      child: BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
        listener: (context, state) {
          if (state is ChangePasswordSuccess) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(
                    'Changed Successfully!',
                    style: TextStyles.grey12Medium.copyWith(
                      fontSize: 16,
                      color:
                          settingsProviders.isDark ? Colors.white : Colors.grey,
                    ),
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Your password has been updated. You can now log in with your new password. If you have any issues, feel free to reach out for assistance!",
                        style: TextStyles.grey12Medium.copyWith(fontSize: 14),
                      ),
                      SizedBox(height: 12.h),
                      SvgPicture.asset(Assets.assetsImagesTrue, height: 80),
                    ],
                  ),
                  actions: [
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                            context,
                            SettingsPage.routeName,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              settingsProviders.isDark
                                  ? kColors[0]
                                  : Colors.black,
                          padding: EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Back to Settings',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          } else if (state is ChangePasswordError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: kColors[0],
                content: Center(child: Text('Wrong Password')),
              ),
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<ChangePasswordCubit>();
          return MainScaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    CustomAppBar(
                      backText: 'Back',
                      onBackPressed: () {},
                      showPendingButton: false,
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        Text(
                          'Change Password',
                          style: TextStyles.grey12Medium.copyWith(fontSize: 20),
                        ),
                      ],
                    ),
                    SizedBox(height: 15.h),

                    // Old password
                    Row(
                      children: [
                        Text(
                          'Your Current Password',
                          style: TextStyles.black12SemiBold.copyWith(
                            fontSize: 12,
                            color:
                                settingsProviders.isDark
                                    ? kColors[3]
                                    : kColors[1],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    CustomTextFiled(
                      controller: oldPasswordController,
                      hittext: 'Password',
                      prefixImage: "assets/images/key.svg",
                      isPassword: true,
                    ),
                    SizedBox(height: 16.h),

                    // New password
                    Row(
                      children: [
                        Text(
                          'Your New Password',
                          style: TextStyles.grey12Medium.copyWith(
                            fontSize: 12,
                            color:
                                settingsProviders.isDark
                                    ? kColors[3]
                                    : kColors[1],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    CustomTextFiled(
                      controller: newPasswordController,
                      hittext: 'Password',
                      prefixImage: "assets/images/key.svg",
                      isPassword: true,
                    ),
                    if (!isNewPasswordValid) ...[
                      SizedBox(height: 4.h),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Password must be at least 8 characters',
                          style: TextStyle(color: kColors[0], fontSize: 12),
                        ),
                      ),
                    ],
                    SizedBox(height: 16.h),

                    // Repeat password
                    Row(
                      children: [
                        Text(
                          'Repeat Your New Password',
                          style: TextStyles.grey12Medium.copyWith(
                            fontSize: 12,
                            color:
                                settingsProviders.isDark
                                    ? kColors[3]
                                    : kColors[1],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    CustomTextFiled(
                      controller: repeatPasswordController,
                      hittext: 'Password',
                      prefixImage: "assets/images/key.svg",
                      isPassword: true,
                    ),
                    if (!isRepeatPasswordValid) ...[
                      SizedBox(height: 4.h),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Password must be at least 8 characters',
                          style: TextStyle(color: kColors[0], fontSize: 12),
                        ),
                      ),
                    ],
                    SizedBox(height: 16.h),

                    // Info
                    RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.black, fontSize: 15),
                        children: [
                          TextSpan(
                            text: 'If you’ve forgotten your password, simply ',
                            style: TextStyles.grey12Medium,
                          ),
                          TextSpan(
                            text: 'sign out',
                            style: TextStyles.red15SemiBold,
                            recognizer:
                                TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SignIn(),
                                      ),
                                    );
                                  },
                          ),
                          TextSpan(
                            text: ' and click on ',
                            style: TextStyles.grey12Medium,
                          ),
                          TextSpan(
                            text: 'Forgot Password?',
                            style: TextStyles.grey12Medium.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text:
                                ' on the login page to reset it using your registered email address.',
                            style: TextStyles.grey12Medium,
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 24.h),

                    // Button
                    state is ChangePasswordLoading
                        ? CircularProgressIndicator(color: kColors[0])
                        : CustomButtoms(
                          text: 'Change Password',
                          color:
                              settingsProviders.isDark
                                  ? kColors[0]
                                  : Colors.black,
                          textcolor: Colors.white,
                          onPressed:
                              isButtonEnabled
                                  ? () {
                                    if (newPasswordController.text !=
                                        repeatPasswordController.text) {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          backgroundColor: kColors[0],
                                          content: Center(
                                            child: Text(
                                              'Passwords do not match',
                                            ),
                                          ),
                                        ),
                                      );
                                      return;
                                    }
                                    cubit.changePassword(
                                      currentPassword:
                                          oldPasswordController.text,
                                      newPassword: newPasswordController.text,
                                    );
                                  }
                                  : null,
                        ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
