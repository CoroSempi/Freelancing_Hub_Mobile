import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iti_freelancing_hub/core/utils/images/app_images.dart';
import 'package:iti_freelancing_hub/core/utils/styles.dart';
import 'package:iti_freelancing_hub/data/presentation/manger/cubit/forget-password/cubit/forgetpassword_cubit.dart';
import 'package:iti_freelancing_hub/data/presentation/views/code.dart';
import 'package:iti_freelancing_hub/data/presentation/views/signIn.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/CustomButtonWidget.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/footer.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/CustomTextField.dart';
class ForgetPassword extends StatefulWidget {
  static const routeName = '/forget-password';

  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ForgetpasswordCubit(),
      child: BlocConsumer<ForgetpasswordCubit, ForgetpasswordState>(
        listener: (context, state) {
          if (state is ForgetpasswordSuccess) {
            Navigator.push(context, MaterialPageRoute(builder: (_) => CodeScreen(email: emailController.text.trim(),)));
          } else if (state is ForgetpasswordFailure) {
            Fluttertoast.showToast(msg: state.error);
          }
        },
        builder: (context, state) {
          final bloc = ForgetpasswordCubit.get(context);
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
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 60),
                    Center(
                      child: Column(
                        children: [
                          SvgPicture.asset(Assets.assetsImagesIti, width: 93, height: 150),
                          SvgPicture.asset(Assets.assetsImagesFreelancingHub, width: 166, height: 30),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),

                    CustomTextFields(
                      hint: 'Email Address',
                      maxLines: 1,
                      controller: emailController,
                      validator: (val) {
                        if (val == null || val.isEmpty) return 'Please enter your email';
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),

                    Text(
                      "If you've forgotten your password, please enter the email address...",
                      style: TextStyles.grey12Medium,
                    ),
                    const SizedBox(height: 16),

                    ConditionalBuilderRec(
                      condition: state is! ForgetpasswordLoading,
                      builder: (_) => CustomButtonWidget(
                        text: 'Send Code',
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            final email = emailController.text.trim();
                            bloc.forgetPassword(email);
                          }
                        },
                      ),
                      fallback: (_) => const Center(child: CircularProgressIndicator()),
                    ),
                    const SizedBox(height: 16),

                    Center(
                      child: RichText(
                        text: TextSpan(
                          text: 'Back to Sign In Page',
                          style: TextStyles.red15SemiBold,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => SignIn()),
                            ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),
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
      ),
    );
  }
}
