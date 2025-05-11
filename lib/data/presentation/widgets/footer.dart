import 'package:flutter/material.dart';
import 'package:iti_freelancing_hub/constants.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16),
        child: const Center(
        child: Text(
          '© 2025 ITI Freelancing Hub. All rights reserved.',
          style: TextStyle(
            fontSize: 14,
            color: kPrimaryColor,  
          ),
        ),
      ),
    );
  }
}