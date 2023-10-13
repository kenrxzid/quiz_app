import 'package:flutter/material.dart';
import 'package:quiz_app/start_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Flutter Demo',
    theme: ThemeData(scaffoldBackgroundColor: Color.fromARGB(255, 98, 0, 190)),
    home: const Scaffold(
      body: StartScreen(),
    ),
  ));
}
