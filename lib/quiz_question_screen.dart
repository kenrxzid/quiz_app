import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/components/buttons/buttons.dart';
import 'package:quiz_app/data/question.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({required this.answerQuiz, super.key});
  final void Function(String answer) answerQuiz;

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreen();
  }
}

class _QuestionScreen extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String answerQuiz) {
    widget.answerQuiz(answerQuiz);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questionList[currentQuestionIndex];
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 300,
            height: 125,
            child: Text(
              currentQuestion.question,
              style: GoogleFonts.montserrat(
                fontSize: 24,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          ...currentQuestion.getShuffledAnswers().map((answerText) {
            return CustomButton(
              text: answerText,
              onPressed: () {
                answerQuestion(answerText);
              },
              backgroundColor: const Color.fromARGB(255, 31, 1, 95),
              foregroundColor: Colors.white,
            );
          })
        ],
      ),
    );
  }
}
