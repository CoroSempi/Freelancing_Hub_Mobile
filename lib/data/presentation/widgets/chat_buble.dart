import 'package:flutter/material.dart';
import 'package:iti_freelancing_hub/constants.dart';

class ChatBuble extends StatelessWidget {
  const ChatBuble({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: kColors[3],
        ),
        child: Text(
          'hello ',
        ),
      ),
    );
  }
}
