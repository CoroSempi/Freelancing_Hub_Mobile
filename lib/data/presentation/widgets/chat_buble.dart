import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:iti_freelancing_hub/constants.dart';
import 'package:iti_freelancing_hub/core/utils/styles.dart';

class ChatBuble extends StatelessWidget {
  final String message;
  final bool isSender;
  final DateTime timestamp;

  const ChatBuble({
    super.key,
    required this.message,
    required this.isSender,
    required this.timestamp,
  });

  @override
  Widget build(BuildContext context) {
    String formattedTime = DateFormat('HH:mm dd MMM').format(timestamp);

    return Column(
      crossAxisAlignment:
          isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Align(
          alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: isSender ? kColors[0] : kColors[3],
            ),
            child: Text(message, style: const TextStyle(color: Colors.white)),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            formattedTime,
            style: TextStyles.grey12Medium.copyWith(fontSize: 12),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
