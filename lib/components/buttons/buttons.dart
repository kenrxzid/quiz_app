import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final String? text;

  const CustomButton(
      {required this.onPressed,
      this.backgroundColor,
      this.foregroundColor,
      this.text,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 45,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton(
        autofocus: false,
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? Colors.white,
          foregroundColor: foregroundColor ?? Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        child: Text(
          text ?? "Button",
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
