import 'package:bquiz/quiztitle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'appstate.dart';
import 'quizinfo.dart';

class SelectQuiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();

    return ListView(
      children: [
        for (QuizInfo quiz in appState.quizes)
          QuizTitle(
            quizInfo: quiz,
          ),
      ],
    );
  }
}
