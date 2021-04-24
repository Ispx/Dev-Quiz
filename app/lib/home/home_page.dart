import 'package:app/challenge/challenge_page.dart';
import 'package:app/core/app_text_styles.dart';
import 'package:app/core/models/quiz_model.dart';
import 'package:app/home/controller/home_controller.dart';
import 'package:app/home/widgets/appbar_widget.dart';
import 'package:app/home/widgets/quiz_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'widgets/levelbutton_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = HomeController();

  @override
  void initState() {
    super.initState();
    _controller.getQuizzes();
    _controller.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<QuizModel>>(
      future: _controller.getData(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (!snapshot.hasData) {
          return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Observer(
              builder: (context) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.wifi_rounded,
                    size: 58,
                    color: Colors.red,
                  ),
                  Text(
                    'Falha de conexão',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  )
                ],
              ),
            ),
          );
        }
        return Scaffold(
          appBar: AppBarWidget(
            userModel: _controller.userModel,
          ),
          body: Container(
            margin: EdgeInsets.only(top: 120),
            child: Observer(
              builder: (context) => Column(
                children: [
                  SizedBox(
                    height: 40,
                    width: double.infinity,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        IconButton(
                          icon: Icon(Icons.cleaning_services),
                          onPressed: () {
                            _controller.filterQuizzes(null);
                          },
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        LevelButtonWidget(
                          label: "Fácil",
                          onTap: () {
                            _controller.filterQuizzes('facil');
                          },
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        LevelButtonWidget(
                          label: "Médio",
                          onTap: () {
                            _controller.filterQuizzes('medio');
                          },
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        LevelButtonWidget(
                          label: "Difícil",
                          onTap: () {
                            _controller.filterQuizzes('dificil');
                          },
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        LevelButtonWidget(
                          label: "Perito",
                          onTap: () {
                            _controller.filterQuizzes('perito');
                          },
                        ),
                        SizedBox(
                          width: 8,
                        ),
                      ],
                    ),
                  ),
                  Observer(
                    builder: (context) => _controller.filter.length > 0
                        ? Expanded(
                            child: GridView.count(
                              crossAxisCount: 2,
                              mainAxisSpacing: 16,
                              crossAxisSpacing: 16,
                              padding: EdgeInsets.all(16),
                              children: _controller.filter.map(
                                (quizModel) {
                                  return QuizCardWidget(
                                    quizModel: quizModel,
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ChallengePage(
                                            title: quizModel.title,
                                            quizModel: quizModel,
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ).toList(),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text(
                              'Nenhum desáfio encontrado!',
                              style: AppTextStyles.body20,
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
