import 'package:first_flutter_project/answer.dart';
import 'package:first_flutter_project/question.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var questions = [
    'What is Flutter?',
    'Who developed the Flutter Framework and continues to maintain it today?',
    'How many types of widgets are there in Flutter?',
    'When building for iOS, Flutter is restricted to an __ compilation strategy',
    'A sequence of asynchronous Flutter events is known as a:',
  ];
  var answers = [
    [
      'Flutter is an open-source backend development framework',
      'Flutter is an open-source UI toolkit',
      'Flutter is an open-source programming language for cross-platform applications',
      'Flutters is a DBMS toolkit'
    ],
    ['Facebook', 'Microsoft', 'Google', 'Oracle'],
    ['2', '4', '6', '8+'],
    ['AOT', 'JIT', 'Transcompilation', 'Recompilation'],
    ['Flow', 'Current', 'Stream', 'Series'],
  ];
  var correctAnswer = [1, 2, 0, 0, 2];
  var questionIndex = 0;

  var score = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Questionnaire"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox.expand(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                if (questionIndex < questions.length) ...[
                  Question(
                      'Q${questionIndex + 1}. ${questions[questionIndex]}'),
                  ...List.generate(answers[questionIndex].length, (index) {
                    bool isCorrectAnswer =
                        correctAnswer[questionIndex] == index;
                    return Answer(
                        answers[questionIndex][index], isCorrectAnswer, () {
                      answerClicked(isCorrectAnswer ? 1 : 0);
                    });
                  }),
                ] else
                  Text(
                    "Score: $score",
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 20),
                  ),
                const Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                    onPressed: reset,
                    child: const Text("Reset"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void answerClicked(int score) {
    setState(() {
      this.score += score;
      // if (questionIndex + 1 < questions.length) {
      questionIndex++;
      // }
    });
  }

  void reset() {
    setState(() {
      questionIndex = 0;
      score = 0;
    });
  }
}
