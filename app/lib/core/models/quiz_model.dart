import 'package:app/core/app_images.dart';
import 'package:app/core/models/question_model.dart';
import 'package:flutter/foundation.dart';

enum LevelEnum { facil, medio, dificil, perito }

extension LevelExtString on String {
  LevelEnum get levelParse => {
        "facil": LevelEnum.facil,
        "medio": LevelEnum.medio,
        "dificil": LevelEnum.dificil,
        "perito": LevelEnum.perito,
      }[this];
}

extension LevelExtLevel on LevelEnum {
  String get levelParse => {
        LevelEnum.facil: "facil",
        LevelEnum.medio: "medio",
        LevelEnum.dificil: "dificil",
        LevelEnum.perito: "perito"
      }[this];
}

extension AppImageExtString on String {
  get imageParse => {
        "blocks": AppImages.blocks,
        "hierarchy": AppImages.hierarchy,
        "laptop": AppImages.laptop,
        "check": AppImages.check,
        "error": AppImages.error,
        "trophy": AppImages.trophy,
        "logo": AppImages.logo,
      }[this];
}

class QuizModel {
  final String title;
  final List<QuestionModel> questions;
  final int questionsAnswered;
  final String image;
  final LevelEnum level;
  QuizModel(
      {@required this.title,
      @required this.questions,
      @required this.image,
      @required this.level,
      this.questionsAnswered = 0});

  factory QuizModel.fromMap(Map map) {
    return QuizModel(
      title: map['title'],
      questions: List<Map>.from(map['questions'])
          .map((e) => QuestionModel.fromMap(e))
          .toList(),
      image: map['image'].toString().imageParse,
      level: map['level'].toString().levelParse,
      questionsAnswered: map['questionsAnswered'],
    );
  }
}
