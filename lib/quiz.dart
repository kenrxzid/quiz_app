import 'package:flutter/material.dart';
import 'package:quiz_app/quiz_question_screen.dart';
import 'package:quiz_app/results_screen.dart';
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
  List<String> selectedAnswers = [];
  String? activeScreen;

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questionList.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = "start-screen";
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(
      data: switchScreen,
    );

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionScreen(
        data: chooseAnswer,
      );
    }

    if (activeScreen == 'result-screen') {
      screenWidget = ResultScreen(
        chosenAnswer: selectedAnswers,
        restart: restartQuiz,
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 98, 0, 190)),
      home: Scaffold(body: screenWidget),
    );
  }
}
