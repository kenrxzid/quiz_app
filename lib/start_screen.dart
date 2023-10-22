import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({required this.data, super.key});

  final void Function() data;

  @override
  Widget build(context) {
    String title = "Learn Quiz App ";
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/quiz-logo.png",
            width: 250,
          ),
          Container(
            padding: const EdgeInsets.only(top: 60, bottom: 40),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TextButton.icon(
            onPressed: data,
            icon: const Icon(Icons.arrow_right_alt),
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            label: const Text("Start Quiz"),
          )
        ],
      ),
    );
  }
}
