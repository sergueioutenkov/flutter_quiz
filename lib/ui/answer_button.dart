import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final bool answer;

  AnswerButton(this.answer);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // True button
      child: Material(
        color: answer ? Colors.greenAccent : Colors.redAccent,
        child: InkWell(
          onTap: () => print("You answered $answer"),
          child: Center(
            child: Container(
              child: Text(answer ? "True" : "False"),
            ),
          ),
        ),
      ),
    );
  }
}
