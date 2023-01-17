import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'appstate.dart';
import 'question.dart';
import 'quiz.dart';

class QuizBuilder extends StatelessWidget {
  const QuizBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    Random random = Random();
    List<String> words;
    switch (appState.current) {
      case 1:
        words = <String>["at", "as", "are", "and", "an", "am", "all", "a"];
        break;
      case 2:
        words = <String>["by", "but", "boy", "box", "book", "big", "bed", "be"];
        break;
      default:
        throw Exception("broke");
    }

    List<Question> questions = <Question>[];
    for (var word in words) {
      List<String> answers = <String>[];

      int correctPosition = random.nextInt(3);

      if (correctPosition == 0) {
        answers.add(word);
      } else {
        String answer = words[random.nextInt(words.length)];
        while (word == answer) {
          answer = words[random.nextInt(words.length)];
        }
      }

      if (correctPosition == 1) {
        answers.add(word);
      } else {
        String answer = words[random.nextInt(words.length)];
        while (word == answer || answers.contains(answer)) {
          answer = words[random.nextInt(words.length)];
        }
        answers.add(answer);
      }

      if (correctPosition == 2) {
        answers.add(word);
      } else {
        String answer = words[random.nextInt(words.length)];
        while (answers.contains(answer)) {
          answer = words[random.nextInt(words.length)];
        }
        answers.add(answer);
      }

      questions.add(Question(word, answers));
    }
    List<Question> quizQuestions = <Question>[];

    while (questions.isNotEmpty) {
      int nextQuestion = random.nextInt(questions.length);
      quizQuestions.add(questions.removeAt(nextQuestion));
    }

    Quiz quiz = Quiz();

    for (Question question in questions) {
      quiz.addQuestion(question);
    }

    return quiz;
  }
}
