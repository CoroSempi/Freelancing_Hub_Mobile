import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iti_freelancing_hub/core/utils/images/app_images.dart';
import 'package:iti_freelancing_hub/core/utils/styles.dart'; // Added import for SvgPicture

class SignIn extends StatelessWidget {
  static const routeName = '/sign-in'; // Added routeName

  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Column(
              children: [
                SvgPicture.asset(
                  Assets.assetsImagesIti,
                   height: 60,
                  width: 60,
                ),
                     SvgPicture.asset(
                  Assets.assetsImagesFreelancingHub,
                   height: 60,
                  width: 60,
                ),
                const SizedBox(height: 8),
                const Text(
                  'Craft Your Career, Shape Your Path',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    const Text('Forgot Password?'),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                       },
                      child: const Text('Reset Password'),
                    ),
                  ],
                ),
                
                                  SizedBox(height: 24),

                ElevatedButton(
                  onPressed: () {
                   },
                  child: const Text('Sign In'),
                ),


                const SizedBox(height: 16),
                Column (
                  children: [
                    Text (
                      'If your email is not registered, please contact the admin in your branch for assistance.',
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Text(
                          'Click here to explore features, benefits, and how to make the most of your experience',
                           style: TextStyles.black12SemiBold.copyWith(color: Colors.red),
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                          },
                          child: const Text('Learn More'),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
