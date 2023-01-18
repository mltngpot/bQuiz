import 'package:bquiz/appstate.dart';
import 'package:bquiz/question.dart';
import 'package:bquiz/quizbuilder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var correct = 0;
  var total = 0;
  QuizBuilder? quizBuilder;

  List<Question> questions = <Question>[];

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    if (quizBuilder == null) {
      quizBuilder = QuizBuilder(appState.current);
      quizBuilder!.build();
      questions = quizBuilder!.getQuizQuestions();
    }

    if (questions.isEmpty) {
      appState.changePage(0);
    }

    var currentQuestion = questions[0];
    questions.remove(currentQuestion);

    return Column(
      children: [
        Row(
          children: [
            currentQuestion.getQuestion(),
          ],
        ),
        Row(
          children: currentQuestion.getAnswers(),
        ),
      ],
    );
  }
}
