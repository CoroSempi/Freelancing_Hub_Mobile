import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iti_freelancing_hub/core/utils/images/app_images.dart';
import 'package:iti_freelancing_hub/core/utils/styles.dart';
import 'package:iti_freelancing_hub/data/presentation/manger/cubit/login_cubit_cubit.dart';
import 'package:iti_freelancing_hub/data/presentation/views/forgetPassword.dart';
import 'package:iti_freelancing_hub/data/presentation/views/homeScreen.dart';
 import 'package:iti_freelancing_hub/data/presentation/widgets/CustomButtonWidget.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/footer.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/CustomTextField.dart';  

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
          Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
         } else if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(35.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                   Container(
                    margin: const EdgeInsets.only(top: 132),
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(Assets.assetsImagesIti, width: 93, height: 150),
                        SvgPicture.asset(Assets.assetsImagesFreelancingHub, width: 166, height: 30),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),

                  // --- Email & Password
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        CustomTextFields(
                          hint: 'Email Address',
                          maxLines: 1,
                          controller: emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) return 'Please enter your email';
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),
                        CustomTextFields(
                          hint: 'Password',
                          maxLines: 1,
                           controller: passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) return 'Please enter your password';
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),

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
                                      side: BorderSide(width: 0.5, color: const Color(0xFFD7777B)),
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text('Remember me', style: TextStyles.red15SemiBold),
                              ],
                            ),
                            InkWell(
                              child: Text('Forgot your password ?', style: TextStyles.red15SemiBold),
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (_) => ForgetPassword()));
                              },
                            ),
                          ],
                        ),

                        const SizedBox(height: 27),

                         state is LoginLoading
                            ? const Center(child: CircularProgressIndicator())
                            : CustomButtonWidget(
                              /*
                              corosempi@gmail.com
                              */ 
                                text: 'Sign In',
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    final email = emailController.text.trim();
                                    final password = passwordController.text.trim();
                                    if (email.isEmpty || password.isEmpty) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(content: Text('Email and Password cannot be empty')),
                                      );
                                    } else {
                                      try {
                                        context.read<LoginCubitCubit>().login( email, password);

                                      } catch (e) {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content: Text('An error occurred: $e')),
                                        );
                                      }
                                    }
                                  }
                                },
                              ),

                        const SizedBox(height: 30),

                        // --- Info Text
                        Text(
                          'If your email is not registered, please contact the admin in your branch for assistance.',
                          style: TextStyles.grey12Medium,
                          textAlign: TextAlign.center,
                        ),

                        const SizedBox(height: 16),

                        // --- Learn More Link
                        RichText(
                          text: TextSpan(
                            style: TextStyle(color: Colors.grey[700], fontSize: 14),
                            children: [
                              const TextSpan(
                                text:
                                    'Click here to explore features, benefits, and how \nto make the most of your experience ',
                                style: TextStyles.grey12Medium,
                              ),
                              TextSpan(
                                text: 'Learn More',
                                style: TextStyles.red15SemiBold,
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamed(context, '/about-it-screen');
                                  },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 100),
                  Footer(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
