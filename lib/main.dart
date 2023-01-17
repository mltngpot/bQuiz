import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'appstate.dart';
import 'quiz.dart';
import 'quizbuilder.dart';
import 'selectquiz.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => AppState(),
        child: MaterialApp(
          title: 'bQuiz',
          theme: ThemeData(
            primarySwatch: Colors.lime,
          ),
          home: const MyHomePage(title: 'bQuiz: learn more, better'),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Widget page;

    var appState = context.watch<AppState>();

    if (appState.current == 0) {
      page = SelectQuiz();
    } else {
      page = const QuizBuilder();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            page,
          ],
        ),
      ),
    );
  }
}
