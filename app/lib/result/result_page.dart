import 'package:app/core/app_images.dart';
import 'package:app/core/app_text_styles.dart';
import 'package:app/core/models/question_model.dart';
import 'package:app/core/models/quiz_model.dart';
import 'package:app/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {
  final String title;
  final List<QuestionModel> questions;
  final int answersRight;
  ResultPage(
      {@required this.title,
      @required this.questions,
      @required this.answersRight});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: Image.asset(AppImages.trophy),
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Parabéns!\n\n',
                    style: AppTextStyles.heading40,
                  ),
                  TextSpan(
                    text: 'Você concluiu\n',
                    style: AppTextStyles.body,
                  ),
                  TextSpan(text: '$title\n', style: AppTextStyles.bodyBold),
                  TextSpan(
                    text: 'Com $answersRight de ${questions.length} acertos.',
                    style: AppTextStyles.body,
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            Container(
              width: double.infinity,
              child: Column(
                children: [
                  FlatButton(
                    onPressed: () {
                      Share.share(
                          'NLW 5 Flutter: Resultado do Quiz: $title  \n Obtive ${answersRight / questions.length}% de aproveitamento!');
                    },
                    padding: EdgeInsets.symmetric(horizontal: 68, vertical: 15),
                    child: Text(
                      'Compartilhar',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    color: Colors.purple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    child: Text('Voltar'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
