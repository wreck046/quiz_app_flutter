import 'package:flutter/material.dart';

class QuestionIdentify extends StatelessWidget {
  const QuestionIdentify({
    super.key,
    required this.questionIndex,
    required this.isQuestionCorrect,
  });

  final int questionIndex;
  final bool isQuestionCorrect;

  @override
  Widget build(BuildContext context) {
    final questionNum = questionIndex + 1;
    return Container(
      width: 40,
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isQuestionCorrect
            ? const Color.fromARGB(255, 18, 106, 229)
            : const Color.fromARGB(255, 232, 22, 22),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        questionNum.toString(),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 213, 194, 194),
        ),
      ),
    );
  }
}
