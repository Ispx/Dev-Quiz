import 'package:app/core/models/question_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class ChallengeController {
  List<QuestionModel> questions;
  int answersRight = 0;
  ValueNotifier<int> currentQuestion = ValueNotifier<int>(0);

  ChallengeController({@required this.questions});

  nextQuestion(int index) {
    if (currentQuestion.value < questions.length) {
      currentQuestion.value = index;
      return;
    }
    return;
  }

  answer(int indexQuestion, int indexAnswer) {
    if (questions[indexQuestion].answers[indexAnswer].isRight == true) {
      answersRight++;
    }
  }
}
