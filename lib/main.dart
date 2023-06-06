import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var questions = ['Question 1', 'Question 2'];
  var questionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Questionnaire"),
        ),
        body: Column(
          children: <Widget>[
            Text(questions[questionIndex]),
            ElevatedButton(onPressed: onPressed, child: const Text("Answer 1")),
            ElevatedButton(onPressed: onPressed, child: const Text("Answer 2")),
            ElevatedButton(onPressed: onPressed, child: const Text("Answer 3")),
          ],
        ),
      ),
    );
  }

  void onPressed() {
    setState(() {
      if (questionIndex + 1 < questions.length) {
        questionIndex++;
      }
    });
  }
}
