import 'package:flutter/material.dart';
import 'package:quiz/pages/score_page.dart';
import 'package:quiz/ui/answer_button.dart';
import 'package:quiz/ui/correct_wrong_overlay.dart';
import 'package:quiz/ui/question_text.dart';
import 'package:quiz/utils/question.dart';
import 'package:quiz/utils/quiz.dart';

class QuizPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return QuizPageState();
  }
}

class QuizPageState extends State<QuizPage> {
  Question currentQuestion;
  Quiz quiz = Quiz([
    Question("Elon Musk is human", false),
    Question("Pizza is healthy", false),
    Question("Flutter is awesome", true),
  ]);

  String questionText;
  int questionNumber;
  bool isCorrect;
  bool displayOverlay = false;

  @override
  void initState() {
    super.initState();
    currentQuestion = quiz.nextQuestion;
    questionText = currentQuestion.question;
    questionNumber = quiz.questionNumber;
  }

  void handleAnswer(bool answer) {
    isCorrect = (currentQuestion.answer == answer);
    quiz.answer(isCorrect);
    this.setState(() {
      displayOverlay = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Column(
          //Main Page
          children: <Widget>[
            AnswerButton(true, () => handleAnswer(true)),
            QuestionText(questionNumber, questionText),
            AnswerButton(false, () => handleAnswer(false)),
          ],
        ),
        displayOverlay
            ? CorrectWrongOverlay(isCorrect, () {
          if (quiz.length == questionNumber) {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        ScorePage(quiz.score, quiz.length)),
                    (Route route) => route == null);
            return;
          }
          currentQuestion = quiz.nextQuestion;
          this.setState(() {
            displayOverlay = false;
            questionText = currentQuestion.question;
            questionNumber = quiz.questionNumber;
          });
        })
            : Container()
      ],
    );
  }
}
