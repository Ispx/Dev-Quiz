import 'package:app/core/models/answer_model.dart';
import 'package:flutter/foundation.dart';

class QuestionModel {
  final String title;
  final List<AnswerModel> answers;
  QuestionModel({@required this.title, @required this.answers})
      : assert(answers.length == 4);

  factory QuestionModel.fromMap(Map map) {
    return QuestionModel(
        title: map['title'],
        answers: List<Map>.from(map['answers'])
            .map((e) => AnswerModel.fromMap(e))
            .toList());
  }
}
