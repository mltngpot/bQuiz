import 'package:bquiz/quizinfo.dart';
import 'package:flutter/cupertino.dart';

class AppState extends ChangeNotifier {
  var current = 0;
  List<QuizInfo> quizes = <QuizInfo>[
    QuizInfo(title: "Level 1", id: 1),
    QuizInfo(title: "Level 2", id: 2),
  ];

  void changePage(int changeTo) {
    current = changeTo;
    notifyListeners();
  }
}
