import 'dart:math';
import 'question.dart';

class QuizBuilder {
  int quizId;
  QuizBuilder(this.quizId);
  List<Question> quizQuestions = <Question>[];

  build() {
    Random random = Random();
    List<String> words;
    switch (quizId) {
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
    quizQuestions = <Question>[];

    while (questions.isNotEmpty) {
      int nextQuestion = random.nextInt(questions.length);
      quizQuestions.add(questions.removeAt(nextQuestion));
    }
  }

  List<Question> getQuizQuestions() {
    return quizQuestions;
  }
}
