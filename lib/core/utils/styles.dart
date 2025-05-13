import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class TextStyles {
  static TextStyle title = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );

  static TextStyle grey12Medium = TextStyle(
    color: Color(0xFFA6A4A4),
    fontSize: 12.sp,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    letterSpacing: 0.24,
  );

  static TextStyle black15Medium = TextStyle(
    color: Color(0xFF2D2D2D),
    fontSize: 12.sp,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
    letterSpacing: 0.24,
  );
  static TextStyle black12SemiBold = TextStyle(
    color: Color(0xFF2D2D2D),
    fontSize: 12.sp,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
  );

  static TextStyle black12SemiBoldWithHeight = TextStyle(
    color: Color(0xFF2D2D2D),
    fontSize: 12.sp,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    height: 2,
  );

  static TextStyle black20SemiBold = TextStyle(
    color: Color(0xFF2D2D2D),
    fontSize: 20.sp,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
  );

  static TextStyle black10SemiBold = TextStyle(
    color: const Color(0xFF2D2D2D),
    fontSize: 10.sp,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    letterSpacing: 0.20,
  );

  static TextStyle black15SemiBold = TextStyle(
    color: Color(0xFF2D2D2D),
    fontSize: 15.sp,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
  );
  static TextStyle red15SemiBold = TextStyle(
    color: Color(0xFFBF272D),
    fontSize: 12.sp,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    letterSpacing: 0.30,
  );

  static TextStyle red15SemiBoldOpacity = TextStyle(
    color: Color(0xFFD7777B),
    fontSize: 12.sp,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    letterSpacing: 0.30,
  );
}
