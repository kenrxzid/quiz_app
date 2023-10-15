import 'package:flutter/material.dart';
import 'package:quiz_app/quiz_question_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/data/question.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // First Option
  // Widget? activeScreen;

  // @override
  // void initState() {
  //   activeScreen = StartScreen(startQuiz: switchScreen);
  //   super.initState();
  // }

  // Second Option
  var activeScreen = "start-screen";
  List<String> selectedAnswer = [];

  void switchScreen() {
    setState(() {
      selectedAnswer = [];
      activeScreen = "question-screen";
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);
    if (selectedAnswer.length == questionList.length) {
      setState(() {
        activeScreen = "start-screen";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 98, 0, 190)),
      home: Scaffold(
        body: activeScreen == "start-screen"
            ? StartScreen(startQuiz: switchScreen)
            : QuestionScreen(
                answerQuiz: chooseAnswer,
              ),
      ),
    );
  }
}
