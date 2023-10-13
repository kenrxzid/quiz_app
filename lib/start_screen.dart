import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(context) {
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
            child: const Text(
              "Learn Flutter the fun Way!",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              "Start Quiz",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.normal,
              ),
            ),
          )
        ],
      ),
    );
  }
}
