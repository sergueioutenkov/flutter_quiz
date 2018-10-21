import 'package:flutter/material.dart';

import '../utils/question.dart';
import '../utils/quiz.dart';

import 'package:quiz/ui/answer_button.dart';

class QuizPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return QuizPageState();
  }
}

class QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          //Main Page
          children: <Widget>[
            AnswerButton(true),
            AnswerButton(false)
          ],
        ),
      ],
    );
  }
}
