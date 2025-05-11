import 'package:flutter/material.dart';

abstract class TextStyles {
  static const TextStyle title = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );

  static const TextStyle grey12Medium = TextStyle(
    color: Color(0xFFA6A4A4),
    fontSize: 12,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    letterSpacing: 0.24,
  );


static const TextStyle black15Medium = TextStyle(
    color: Color(0xFF2D2D2D),
    fontSize: 12,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
    letterSpacing: 0.24,
  );
  static const TextStyle black12SemiBold = TextStyle(
    color: Color(0xFF2D2D2D),
    fontSize: 12,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
  );

  static const TextStyle black12SemiBoldWithHeight = TextStyle(
    color: Color(0xFF2D2D2D),
    fontSize: 12,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    height: 2,
  );

  static const TextStyle black20SemiBold = TextStyle(
    color: Color(0xFF2D2D2D),
    fontSize: 20,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
  );

 static const TextStyle black10SemiBold = TextStyle(
       color: const Color(0xFF2D2D2D),
                    fontSize: 10,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.20,
                  
  );


  static const TextStyle black15SemiBold = TextStyle(
    color: Color(0xFF2D2D2D),
    fontSize: 15,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
  );
  static const TextStyle red15SemiBold = TextStyle(
    color: Color(0xFFBF272D),
    fontSize: 12,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    letterSpacing: 0.30,
  );

    static const TextStyle red15SemiBoldOpacity = TextStyle(
    color: Color(0xFFD7777B),
    fontSize: 12,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    letterSpacing: 0.30,
  );
}
