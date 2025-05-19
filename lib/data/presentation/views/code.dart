import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iti_freelancing_hub/core/utils/images/app_images.dart';
import 'package:iti_freelancing_hub/core/utils/styles.dart';
import 'package:iti_freelancing_hub/data/presentation/manger/cubit/forget-password/cubit/forgetpassword_cubit.dart';
 import 'package:iti_freelancing_hub/data/presentation/manger/cubit/verify-code/cubit/verifycode_cubit.dart';
import 'package:iti_freelancing_hub/data/presentation/views/changePasswordAuth.dart';
import 'package:iti_freelancing_hub/data/presentation/views/signIn.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/CustomButtonWidget.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/footer.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/input-box-controller.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/input_box.dart';
 

class CodeScreen extends StatefulWidget {
  static const routeName = '/code-screen';
  final String email;

  const CodeScreen({super.key, required this.email});

  @override
  State<CodeScreen> createState() => _CodeScreenState();
}

class _CodeScreenState extends State<CodeScreen> {
  final List<TextEditingController> controller =
      List.generate(6, (index) => TextEditingController());
  final List<FocusNode> focusNodes =
      List.generate(6, (index) => FocusNode());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      focusNodes[0].requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    final bloc = VerifycodeCubit.get(context);
    final resend = ForgetpasswordCubit.get(context);

    return BlocConsumer<VerifycodeCubit, VerifycodeState>(
      listener: (context, state) {
        if (state is VerifycodeSuccess) {
          if (bloc.verifyToken != null && bloc.verifyToken!.isNotEmpty) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) =>
                    Changepasswordauth(verifyToken: bloc.verifyToken!),
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content: Text('Verification failed: No valid token received')),
            );
          }
        } else if (state is VerifycodeFailure) {
          print('the token is ${bloc.verifyToken}');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
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
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  Center(
                    child: Column(
                      children: [
                        SvgPicture.asset(Assets.assetsImagesIti, width: 93, height: 150),
                        SvgPicture.asset(Assets.assetsImagesFreelancingHub, width: 166, height: 30),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Enter Verification Code',
                    style: TextStyles.black20SemiBold,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      6,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: InputBoxController(
                          controller: controller[index],
                          focusNode: focusNodes[index],
                          onChanged: (value) {
                            if (value.isNotEmpty && index < 5) {
                              FocusScope.of(context).requestFocus(focusNodes[index + 1]);
                            } else if (value.isEmpty && index > 0) {
                              FocusScope.of(context).requestFocus(focusNodes[index - 1]);
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'We have sent an email to your registered email address with a verification code.',
                    style: TextStyles.grey12Medium,
                  ),
                  const SizedBox(height: 15),
                  ConditionalBuilderRec(
                    condition: state is! VerifycodeLoading,
                    builder: (_) => CustomButtonWidget(
                      text: 'Verify Code',
                      onPressed: () {
                        String code = controller.map((c) => c.text).join();
                        if (code.length == 6) {
                          bloc.verifyCode(widget.email, code);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Please enter a 6-digit code')),
                          );
                        }
                      },
                    ),
                    fallback: (_) => const Center(child: CircularProgressIndicator()),
                  ),
                  const SizedBox(height: 16),
                  CustomButtonWidget(
                    text: 'Resend Code',
                    onPressed: () {
                      resend.forgetPassword(widget.email);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Code resent successfully')),
                      );
                   },
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: RichText(
                      text: TextSpan(
                        text: 'Back to Sign In Page',
                        style: TextStyles.red15SemiBold,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => SignIn()),
                            );
                          },
                      ),
                    ),
                  ),
                  const Spacer(),
                  Footer(),
                ],
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
