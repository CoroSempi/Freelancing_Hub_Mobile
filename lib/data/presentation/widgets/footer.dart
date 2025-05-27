import 'package:flutter/material.dart';
import 'package:iti_freelancing_hub/constants.dart';
import 'package:iti_freelancing_hub/generated/l10n.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16),
        child: Center(
        child: Text(
           S.of(context).footerCopyright,
          style: const TextStyle(
            fontSize: 14,
            color: kPrimaryColor,  
          ),
        ),
      ),
    );
  }
}