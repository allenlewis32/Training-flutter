import 'package:flutter/material.dart';

typedef OnPressedSignature = void Function()?;

class Answer extends StatelessWidget {
  final String answerText;
  final bool isCorrectAnswer;

  final OnPressedSignature onPressed;

  const Answer(this.answerText, this.isCorrectAnswer, this.onPressed,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          animationDuration: const Duration(seconds: 1),
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return isCorrectAnswer ? Colors.greenAccent : Colors.redAccent;
              }
              return null;
            },
          ),
        ),
        child: Text(answerText),
      ),
    );
  }
}
