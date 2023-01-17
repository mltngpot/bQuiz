import 'package:bquiz/question.dart';
import 'package:flutter/material.dart';

class Quiz extends StatelessWidget {
  Quiz({super.key});

  var current = 0;
  var correct = 0;
  var total = 0;
  List<Question> questions = <Question>[];

  void addQuestion(Question question) {
    questions.add(question);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            questions[current].getQuestion(),
          ],
        ),
        Row(
          children: questions[current].getAnswers(),
        ),
      ],
    );
  }
}
