
import 'package:flutter/material.dart';
class FormFieldWidget extends StatelessWidget {
  static const routeName = '/form-field';
String title;
String subtitle;
String hintText;
FormFieldWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.hintText,
  });
   @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 5,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: title,
                      style: TextStyle(
                        color: const Color(0xFF2D2D2D),
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text:  subtitle,
                      style: TextStyle(
                        color: const Color(0xFFA6A4A4),
                        fontSize: 10,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 350,
                height: 40,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      color: const Color(0x7FBF272D),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Text(
                 hintText,
                style: TextStyle(
                  color: const Color(0xFFA6A4A4),
                  fontSize: 10,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}