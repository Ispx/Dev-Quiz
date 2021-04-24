import 'package:app/core/models/quiz_model.dart';
import 'package:app/core/models/user_model.dart';
import 'package:app/home/repository/home_repository.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  UserModel userModel;
  @observable
  List<QuizModel> quizzes;
  @observable
  Iterable<QuizModel> filter;

  final _repository = HomeRepository();

  Future<UserModel> getUser() async {
    this.userModel = await _repository.getUser();
    return this.userModel;
  }

  Future<List<QuizModel>> getQuizzes() async {
    this.quizzes = await _repository.getQuizzes();
    filter = quizzes;
    return this.quizzes;
  }

  @action
  void filterQuizzes(String level) {
    filter = quizzes;
    if (level != null) {
      filter =
          this.quizzes.where((element) => element.level.levelParse == level);
      return;
    }
    filter = quizzes;
  }

  Future<List<QuizModel>> getData() async {
    await getUser();
    return _repository.getQuizzes();
  }
}
