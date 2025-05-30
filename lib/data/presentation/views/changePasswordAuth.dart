import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iti_freelancing_hub/core/utils/images/app_images.dart';
import 'package:iti_freelancing_hub/core/utils/styles.dart';
import 'package:iti_freelancing_hub/data/presentation/manger/cubit/reset-password/cubit/resetpassword_cubit.dart';
import 'package:iti_freelancing_hub/data/presentation/views/changeSuccessfully.dart';
import 'package:iti_freelancing_hub/data/presentation/views/signIn.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/CustomButtonWidget.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/fluttertoast.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/footer.dart';
import 'package:iti_freelancing_hub/generated/l10n.dart';

class Changepasswordauth extends StatefulWidget {
  static const routeName = '/changepasswordauth';

  final String verifyToken;

  const Changepasswordauth({super.key, required this.verifyToken});

  @override
  State<Changepasswordauth> createState() => _ChangepasswordauthState();
}

class _ChangepasswordauthState extends State<Changepasswordauth> {
  final reapeatpasswordcontroller = TextEditingController();
  final newPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool obscureNewPassword = true;
  bool obscureRepeatPassword = true;

  @override
  Widget build(BuildContext context) {
    final resetCubit = ResetpasswordCubit.get(context);
    final s = S.of(context);

    return BlocConsumer<ResetpasswordCubit, ResetpasswordState>(
      listener: (context, state) {
        if (state is ResetpasswordSuccess) {
          showDialog(
            context: context,
            builder: (context) => ChangeSuccessfullyDialog(),
          );
        } else if (state is ResetpasswordFailure) {
    ToastMessage.showError(context,  state.error);        }
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
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                            const SizedBox(height: 30),

                            // New Password
                            TextFormField(
                              controller: newPasswordController,
                              obscureText: obscureNewPassword,
                              decoration: InputDecoration(
                                hintText: s.resetPassword_placeholder1,
                                suffixIcon: IconButton(
                                  icon: Icon(obscureNewPassword ? Icons.visibility_off : Icons.visibility),
                                  onPressed: () {
                                    setState(() {
                                      obscureNewPassword = !obscureNewPassword;
                                    });
                                  },
                                ),
                              ),
                              validator: (val) {
                                if (val == null || val.isEmpty) return s.errors_passwordRequired;
                                if (val.length < 8) return s.errors_passwordMinLength;
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),

                            // Repeat Password
                            TextFormField(
                              controller: reapeatpasswordcontroller,
                              obscureText: obscureRepeatPassword,
                              decoration: InputDecoration(
                                hintText: s.resetPassword_placeholder2,
                                suffixIcon: IconButton(
                                  icon: Icon(obscureRepeatPassword ? Icons.visibility_off : Icons.visibility),
                                  onPressed: () {
                                    setState(() {
                                      obscureRepeatPassword = !obscureRepeatPassword;
                                    });
                                  },
                                ),
                              ),
                              validator: (val) {
                                if (val == null || val.isEmpty) return s.errors_passwordRequired;
                                if (val != newPasswordController.text) return  s.errors_passwordRequired;
                              },
                            ),
                            const SizedBox(height: 30),

                            // Submit
                            state is ResetpasswordLoading
                                ? const Center(child: CircularProgressIndicator())
                                : CustomButtonWidget(
                                    text: s.resetPassword_submit,
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        resetCubit.resetPassword(
                                          newPassword: newPasswordController.text.trim(),
                                          token: widget.verifyToken,
                                        );
                                      }
                                    },
                                  ),
                            const SizedBox(height: 20),

                            // Back to sign in
                            Align(
                              alignment: Alignment.centerRight,
                              child: RichText(
                                text: TextSpan(
                                  text: s.resetPassword_signIn,
                                  style: TextStyles.red15SemiBold,
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pushReplacement(
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
