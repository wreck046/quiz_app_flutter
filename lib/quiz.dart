import 'package:flutter/material.dart';
import 'package:quiz_app_flutter/container_body.dart';
import 'package:quiz_app_flutter/data/question.dart';
import 'package:quiz_app_flutter/question_screen.dart';
import 'package:quiz_app_flutter/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswer = [];

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);

    if (selectedAnswer.length == question.length) {
      setState(() {
        activescreen = 'result-screen';
      });
    }
  }

  void restart() {
    setState(() {
      selectedAnswer = [];
      activescreen = 'question-screen';
    });
  }

  /* Widget? activescreen;

  @override
  void initState() { //initState
    activescreen = BodyContainer(switchScreen); 
    super.initState();
  } */
  var activescreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activescreen = 'question-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenwidget = BodyContainer(switchScreen);

    if (activescreen == 'question-screen') {
      screenwidget = QuestionScreen(
        onSelectQuestion: chooseAnswer,
      );
    } /* else if (activescreen != 'start-screen') {
      screenwidget = const QuestionScreen();
    } */

    if (activescreen == 'result-screen') {
      screenwidget = ResultScreen(
        chosenAnswer: selectedAnswer,
        Restart: restart,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 79, 235, 12),
                Color.fromARGB(255, 127, 250, 113),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenwidget,
          /* child: activescreen == 'start-screen'
              ? BodyContainer(switchScreen) //condition met
              : const QuestionScreen(), //condition not met */
        ),
      ),
    );
  }
}
