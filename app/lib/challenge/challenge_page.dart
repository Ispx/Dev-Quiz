import 'package:app/challenge/widgets/next_button/next_button_widget.dart';
import 'package:app/challenge/widgets/question_indicator/questions_indicator_widget.dart';
import 'package:app/challenge/widgets/quiz/quiz_widget.dart';
import 'package:app/core/app_colors.dart';
import 'package:app/core/models/quiz_model.dart';
import 'package:app/result/result_page.dart';
import 'package:flutter/material.dart';

import 'controllers/challenge_controller.dart';

class ChallengePage extends StatefulWidget {
  final QuizModel quizModel;
  final String title;
  ChallengePage({@required this.title, @required this.quizModel});
  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  ChallengeController _controller;
  final pageController = PageController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = ChallengeController(questions: widget.quizModel.questions);
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    return Scaffold(
      appBar: PreferredSize(
        child: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Colors.grey.shade700,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              QuestionIndicatorWidget(
                currentQuestion: _controller.currentQuestion.value + 1,
                lenghtQuestions: _controller.questions.length,
              ),
            ],
          ),
        )),
        preferredSize: Size.fromHeight(90),
      ),
      body: Container(
          width: media.size.width,
          height: media.size.height,
          padding: EdgeInsets.all(8),
          child: PageView(
            controller: pageController,
            physics: NeverScrollableScrollPhysics(),
            onPageChanged: (value) {
              _controller.nextQuestion(value);
              setState(() {});
            },
            children: widget.quizModel.questions
                .map(
                  (e) => QuizWidget(
                    questionModel: e,
                    onSelected: (indexSelected) {
                      _controller.answer(
                          _controller.currentQuestion.value, indexSelected);
                      if (_controller.currentQuestion.value ==
                          _controller.questions.length - 1) {
                        return null;
                      }
                      pageController.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOutCirc,
                      );
                      _controller.nextQuestion(pageController.initialPage);
                      setState(() {});
                    },
                  ),
                )
                .toList(),
          )),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: NextButtonWidget(
                  label: 'Voltar',
                  colorBackground: AppColors.lightGrey,
                  colorText: AppColors.grey,
                  overlayColor: Colors.grey[700],
                  onPressed: () {
                    pageController.previousPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOutCirc);
                    _controller.nextQuestion(pageController.initialPage);
                  },
                ),
              ),
              SizedBox(
                width: 7,
              ),
              _controller.currentQuestion.value ==
                      _controller.questions.length - 1
                  ? Expanded(
                      child: NextButtonWidget(
                        label: 'Finalizar',
                        colorBackground: AppColors.darkGreen,
                        colorText: AppColors.white,
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ResultPage(
                                  title: widget.title,
                                  questions: widget.quizModel.questions,
                                  answersRight: _controller.answersRight,
                                ),
                              ),
                              (route) => false);
                        },
                        overlayColor: Colors.green[700],
                      ),
                    )
                  : SizedBox(
                      width: 7,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
