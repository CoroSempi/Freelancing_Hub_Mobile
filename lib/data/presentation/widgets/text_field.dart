import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iti_freelancing_hub/constants.dart';

class CustomTextFiled extends StatefulWidget {
  const CustomTextFiled({
    super.key,
    this.hittext,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixImage,
    this.suffixImage,
    this.controller,
    this.validator,
    this.isPassword = false,
    this.hitcolor,
    this.onTap,
    this.readOnly = false,
  });

  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hittext;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool isPassword;
  final Color? hitcolor;
  final String? prefixImage;
  final String? suffixImage;

  final VoidCallback? onTap;
  final bool readOnly;

  @override
  State<CustomTextFiled> createState() => _CustomTextFiledState();
}

class _CustomTextFiledState extends State<CustomTextFiled> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      obscureText: widget.isPassword ? obscureText : false,
      readOnly: widget.readOnly,
      onTap: widget.onTap,
      decoration: InputDecoration(
        hintText: widget.hittext,
        hintStyle: TextStyle(color: widget.hitcolor),
        prefixIcon:
            widget.prefixImage != null
                ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(widget.prefixImage!),
                )
                : widget.prefixIcon,
        suffixIcon:
            widget.isPassword
                ? IconButton(
                  icon: Icon(
                    obscureText ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                )
                : widget.suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: kColors[5]),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: kColors[0]),
        ),
      ),
    );
  }
}
