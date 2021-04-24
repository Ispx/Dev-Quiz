import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:app/core/models/quiz_model.dart';
import 'package:app/core/models/user_model.dart';

class HomeRepository {
  Future<UserModel> getUser() async {
    final response = await http.get(
        'https://gist.githubusercontent.com/Ispx/75536c8b952b37a1974bba069a79ff59/raw/8a7b41a6dd055976206595391de3274c43dd3245/user.json');
    final user = UserModel.fromJson(response.body);
    return user;
  }

  Future<List<QuizModel>> getQuizzes() async {
    final response = await http.get(
        'https://gist.githubusercontent.com/Ispx/8dcb7cd65602ade9ace9bab8a0531b04/raw/55b5d7ea09240a2cf5baa321227048b728aa44e6/quizzes.json');
    final list = jsonDecode(response.body) as List;
    final quizzes = list.map((e) => QuizModel.fromMap(e)).toList();
    return quizzes;
  }
}
