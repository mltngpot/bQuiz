import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Question {
  List<String> answers;

  String question;

  Question(this.question, this.answers);

  var player = FlutterTts();

  Widget getQuestion() {
    return IconButton(
      onPressed: () {
        player.speak(question);
      },
      icon: const Icon(Icons.play_arrow),
    );
  }

  List<Widget> getAnswers() {
    List<Widget> answersWidgets = <Widget>[];
    answersWidgets.add(ElevatedButton(
      onPressed: () {},
      child: Text(answers[0]),
    ));
    answersWidgets.add(ElevatedButton(
      onPressed: () {},
      child: Text(answers[1]),
    ));
    answersWidgets.add(ElevatedButton(
      onPressed: () {},
      child: Text(answers[2]),
    ));

    return answersWidgets;
  }
}
