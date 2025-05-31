import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iti_freelancing_hub/constants.dart';
import 'package:iti_freelancing_hub/core/utils/images/app_images.dart';
import 'package:iti_freelancing_hub/core/utils/styles.dart';
import 'package:iti_freelancing_hub/data/presentation/manger/cubit/login_cubit_cubit.dart';
import 'package:iti_freelancing_hub/data/presentation/views/forgetPassword.dart';
import 'package:iti_freelancing_hub/data/presentation/views/homeScreen.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/CustomButtonWidget.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/fluttertoast.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/footer.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/CustomTextField.dart';
import 'package:iti_freelancing_hub/generated/l10n.dart';

class SignIn extends StatelessWidget {
  static const routeName = '/sign-in';

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    var Bloc1 = LoginCubitCubit.get(context);
              final s = S.of(context);


    return BlocConsumer<LoginCubitCubit, LoginCubitState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        } else if (state is LoginFailure) {
          ToastMessage.showError(context, state.error);
        }
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          body: SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  padding: EdgeInsets.only(
                    left: 35,
                    right: 35,
                    bottom: MediaQuery.of(context).viewInsets.bottom + 20,
                  ),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: IntrinsicHeight(
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            const SizedBox(height: 60),
                            SvgPicture.asset(
                              Assets.assetsImagesIti,
                              width: 93,
                              height: 150,
                            ),
                            SvgPicture.asset(
                              Assets.assetsImagesFreelancingHub,
                              width: 166,
                              height: 30,
                            ),
                            const SizedBox(height: 25),

                            CustomTextFields(
                              hint: s.emailHint,
                              maxLines: 1,
                              controller: emailController,
                              prefixIcon: Icon(Icons.email, color: kColors[5]),

                              // SvgPicture.asset(Assets.assetsImagesEmail, width: 10, height: 10),
                              validator: (value) {
                                if (value == null || value.isEmpty)
                                  return s.emailRequired;
                                return null;
                              },
                            ),
                            const SizedBox(height: 10),
                            CustomTextFields(
                             
                                hint: s.passwordHint,
                              
                              maxLines: 1,
                              controller: passwordController,
                              obscureText: Bloc1.isHidePassword,
                              validator: (String? val) {
                                if (val == null || val.isEmpty)
                                  return s.passwordRequired;
                                return null;
                              },
                              keyboardType: TextInputType.visiblePassword,
                             prefixIcon: SvgPicture.asset(
  Assets.assetsImagesCarbonPassword,
  width: 20,
  height: 20,
  fit: BoxFit.scaleDown,  
),
                              suffixIcon: IconButton(
                                onPressed: () => Bloc1.changePassword(),
                                icon: Icon(
                                  Bloc1.passwordIcon,
                                  color: kPrimaryColor,
                                ),
                                highlightColor: Colors.transparent,
                              ),
                              cursorColor: kPrimaryColor,
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
                                          side: BorderSide(
                                            width: 0.5,
                                            color: const Color(0xFFD7777B),
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            2,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                       s.rememberMeLabel,
                                      style: TextStyles.red15SemiBold,
                                    ),
                                  ],
                                ),
                                InkWell(
                                  child: Text(
                                    s.forgotPasswordLink,
                                    style: TextStyles.red15SemiBold,
                                  ),
                                  onTap:
                                      () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => ForgetPassword(),
                                        ),
                                      ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 27),

                            state is LoginLoading
                                ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                                : CustomButtonWidget(
                                    text: s.signInButton,
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      final email = emailController.text.trim();
                                      final password =
                                          passwordController.text.trim();
                                      if (email.isEmpty || password.isEmpty) {
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                            SnackBar(
                                            content: Text(
                                                s.forgotPasswordLink,
                                            ),
                                          ),
                                        );
                                      } else {
                                        try {
                                          context.read<LoginCubitCubit>().login(
                                            email,
                                            password,
                                          );
                                        } catch (e) {
                                          ToastMessage.showError(
                                            context,
                                            e.toString(),
                                          );
                                        }
                                      }
                                    }
                                  },
                                ),

                            const SizedBox(height: 30),
                            Text(
                               s.emptyCredentialsError,
                              style: TextStyles.grey12Medium,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 16),
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 14,
                                ),
                                children: [
                                  TextSpan(
                                    
                                          text: s.exploreFeaturesText,
                                    style: TextStyles.grey12Medium,
                                  ),
                                  TextSpan(
                                    text:  s.learnMoreLink,
                                    style: TextStyles.red15SemiBold,
                                    recognizer:
                                        TapGestureRecognizer()
                                          ..onTap =
                                              () => Navigator.pushNamed(
                                                context,
                                                '/about-it-screen',
                                              ),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            Footer(),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}



 

 

 
                                    
   

                                    
                                            

                                                 
                                    

     