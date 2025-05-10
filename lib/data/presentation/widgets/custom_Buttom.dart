import 'package:flutter/material.dart';

class CustomButtoms extends StatelessWidget {
  final String text;
  final Color color;
  final Color textcolor;
  final VoidCallback? onPressed;

  const CustomButtoms({
    super.key,
    required this.text,
    required this.color,
    required this.textcolor,
    this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        textStyle: const TextStyle(fontSize: 20),
        minimumSize: const Size(double.infinity, 60),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textcolor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
