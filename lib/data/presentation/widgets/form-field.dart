import 'package:flutter/material.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/text_field.dart';

class FormFieldWidget extends StatelessWidget {
  static const routeName = '/form-field';

  final String title;
  final String subtitle;
  final String? hintText;

  FormFieldWidget({
    Key? key,
    required this.title,
    required this.subtitle,
     this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
                text: subtitle,
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
        const SizedBox(height: 5),

        CustomTextFiled(),

        const SizedBox(height: 5),
        Text(
          hintText!,
          style: TextStyle(
            color: const Color(0xFFA6A4A4),
            fontSize: 10,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
