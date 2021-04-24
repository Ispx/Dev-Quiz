import 'package:flutter/widgets.dart';

class AnswerModel {
  final String title;
  final bool isRight;
  AnswerModel({@required this.title, this.isRight = false});

  factory AnswerModel.fromMap(Map map) {
    return AnswerModel(title: map['title'], isRight: map['isRight']);
  }
}
