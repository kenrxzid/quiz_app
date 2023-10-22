import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/question.dart';
import 'package:quiz_app/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.chosenAnswer, this.restart});
  final List<String> chosenAnswer;
  final void Function()? restart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questionList[i].question,
        'correct_answer': questionList[i].answer[0],
        'user_answer': chosenAnswer[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestion = questionList.length;
    final correctAnswer = summaryData
        .where((data) => data['user_answer'] == data['correct_answer'])
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $correctAnswer of $numTotalQuestion questions correctly!',
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                color: const Color.fromARGB(218, 255, 255, 255),
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(summaryData: getSummaryData()),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: restart,
              icon: const Icon(Icons.restart_alt),
              label: const Text('Restart Quiz!'),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
