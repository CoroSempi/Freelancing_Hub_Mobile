import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iti_freelancing_hub/core/utils/images/app_images.dart';
import 'package:iti_freelancing_hub/core/utils/styles.dart';
import 'package:iti_freelancing_hub/data/presentation/manger/cubit/login_cubit_cubit.dart';
import 'package:iti_freelancing_hub/data/presentation/views/forgetPassword.dart';
import 'package:iti_freelancing_hub/data/presentation/views/homeScreen.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/CustomButtonWidget.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/footer.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/CustomTextField.dart';

// SignIn.dart
class SignIn extends StatelessWidget {
  static const routeName = '/sign-in';

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubitCubit, LoginCubitState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        } else if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.all(25.0),
            child: Form(
              key: formKey,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        SvgPicture.asset(
                          Assets.assetsImagesIti,
                          width: 93,
                          height: 130,
                        ),
                        SvgPicture.asset(
                          Assets.assetsImagesFreelancingHub,
                          width: 166,
                          height: 30,
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),

                    // Email & Password
                    CustomTextFields(
                      hint: 'Email Address',
                      maxLines: 1,
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10.h),

                    CustomTextFields(
                      hint: 'Password',
                      maxLines: 1,
                      controller: passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 5.h),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 10,
                              height: 10,
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 0.5,
                                    color: const Color(0xFFD7777B),
                                  ),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Text('Remember me', style: TextStyles.red15SemiBold),
                          ],
                        ),
                        InkWell(
                          child: Text(
                            'Forgot your password ?',
                            style: TextStyles.red15SemiBold,
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => ForgetPassword()),
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 18.h),

                    state is LoginLoading
                        ? const Center(child: CircularProgressIndicator())
                        : CustomButtonWidget(
                            text: 'Sign In',
                            onPressed: () {
                              final email = emailController.text?.trim() ?? '';
                              final password = passwordController.text?.trim() ?? '';

                              if (!formKey.currentState!.validate()) return;

                              if (email.isEmpty || password.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Email and Password cannot be empty'),
                                  ),
                                );
                              } else {
                                try {
                                  context.read<LoginCubitCubit>().login(
                                    email,
                                    password,
                                  );
                                } catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('An error occurred: $e')),
                                  );
                                }
                              }
                            },
                          ),
                    SizedBox(height: 10.h),

                    Column(
                      children: [
                        Text(
                          'If your email is not registered, please contact the admin in your branch for assistance.',
                          style: TextStyles.grey12Medium,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 8.h),
                        Center(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: TextStyle(color: Colors.grey[700], fontSize: 14),
                              children: [
                                TextSpan(
                                  text: 'Click here to explore features, benefits, and how to make the most of your experience ',
                                  style: TextStyles.grey12Medium,
                                ),
                                TextSpan(
                                  text: 'Learn More',
                                  style: TextStyles.red15SemiBold,
                                  recognizer: TapGestureRecognizer()..onTap = () {
                                    Navigator.pushNamed(context, '/about-it-screen');
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}