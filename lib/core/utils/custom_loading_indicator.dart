
import 'package:flutter/material.dart';
import 'package:iti_freelancing_hub/constants.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: CircularProgressIndicator(
        color: kColors[0],
      ),
    );
  }
}
