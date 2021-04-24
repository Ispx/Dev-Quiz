// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on HomeControllerBase, Store {
  final _$quizzesAtom = Atom(name: 'HomeControllerBase.quizzes');

  @override
  List<QuizModel> get quizzes {
    _$quizzesAtom.reportRead();
    return super.quizzes;
  }

  @override
  set quizzes(List<QuizModel> value) {
    _$quizzesAtom.reportWrite(value, super.quizzes, () {
      super.quizzes = value;
    });
  }

  final _$filterAtom = Atom(name: 'HomeControllerBase.filter');

  @override
  Iterable<QuizModel> get filter {
    _$filterAtom.reportRead();
    return super.filter;
  }

  @override
  set filter(Iterable<QuizModel> value) {
    _$filterAtom.reportWrite(value, super.filter, () {
      super.filter = value;
    });
  }

  final _$HomeControllerBaseActionController =
      ActionController(name: 'HomeControllerBase');

  @override
  void filterQuizzes(String level) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.filterQuizzes');
    try {
      return super.filterQuizzes(level);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
quizzes: ${quizzes},
filter: ${filter}
    ''';
  }
}
