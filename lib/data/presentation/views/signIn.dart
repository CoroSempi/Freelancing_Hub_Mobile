import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iti_freelancing_hub/core/utils/images/app_images.dart';
import 'package:iti_freelancing_hub/core/utils/styles.dart';
import 'package:iti_freelancing_hub/data/presentation/views/forgetPassword.dart';
import 'package:iti_freelancing_hub/data/presentation/views/homeScreen.dart';
 import 'package:iti_freelancing_hub/data/presentation/widgets/CustomButtonWidget.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/footer.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/CustomTextField.dart';  

class SignIn extends StatelessWidget {
  static const routeName = '/sign-in';  

  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 

         Padding(
           padding: const EdgeInsets.all(35.0),
       
           child: Column(
            children: [
                  Container(
              margin: const EdgeInsets.only(top: 132),
           
             width: double.infinity,
             child: Column(
               mainAxisSize: MainAxisSize.min,
               mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
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
               ],
             ),
           ) , 
              const SizedBox(height: 15),
          
              Container(
                padding: const EdgeInsets.all(16.0),
                  width: double.infinity,
           
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                 CustomTextFields(
                   hint: 'Email Address ' ,
                   maxLines: 1,
                     
                 ),
                    const SizedBox(height: 10),
                  CustomTextFields(
                   hint: 'Password',
                   maxLines: 1,
                 ),
                    const SizedBox(height: 20),
                 Container(
                  width: double.infinity,
                  child: Row(      
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,             
                     children: [
                      Row(
                 
                        spacing: 8,
                        children: [
                          Container(
                width: 10,
                height: 10,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 0.50,
                      color: const Color(0xFFD7777B),
                    ),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                          ),
                          Text(
                'Remember me',
                textAlign: TextAlign.right,
                style: TextStyles.red15SemiBold
                          ),
                        ],
                      ),
                      InkWell(
                        child: Text(
                          'Forgot your password ?  ',
                          textAlign: TextAlign.right,
                          style:  TextStyles.red15SemiBold , 
                        ),
                        onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder:  (context) =>   ForgetPassword()));
                        },
                      ),
                    ],
                  ),
                ) ,
                    
                                      SizedBox(height: 27),
                
                 CustomButtonWidget(
                    text: 'Sign In',
                    onPressed: () {
                                              Navigator.push(context, MaterialPageRoute(builder:  (context) =>   HomeScreen()));

                     },
                  ),
              const SizedBox(height: 30),
                    Column (
                      children: [
                        Text (
                          'If your email is not registered, please contact the admin in your branch for assistance.',
                          style: TextStyles.grey12Medium,
                        ),
                        const SizedBox(height: 16),
                     Row(
                       crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Expanded(
      child: RichText(
        text: TextSpan(
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 14,
          ),
          children: [
            const TextSpan(
              text:
                  'Click here to explore features, benefits, and how \nto make the most of your experience ',
              style: TextStyles.grey12Medium, 
            ),
            TextSpan(
              text: 'Learn More',
              style:   TextStyles.red15SemiBold , 
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.pushNamed(
                    context,
                    '/about-it-screen',  
                  );
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
                  ],
                ),
              ),
                         const SizedBox(height: 100),
 
           Footer(),
            ],
            
                   ),
       
         ),
      );
    
  }
}
