import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'appstate.dart';
import 'quizinfo.dart';

class QuizTitle extends StatelessWidget {
  const QuizTitle({Key? key, required this.quizInfo}) : super(key: key);

  final QuizInfo quizInfo;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();

    return ElevatedButton(
      onPressed: () {
        appState.changePage(quizInfo.id);
      },
      child: Text(quizInfo.title),
    );
  }
}
