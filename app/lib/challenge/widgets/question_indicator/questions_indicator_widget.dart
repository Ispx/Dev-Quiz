import 'package:app/core/app_colors.dart';
import 'package:app/core/app_text_styles.dart';
import 'package:app/core/shared/progress_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QuestionIndicatorWidget extends StatefulWidget {
  final int currentQuestion;
  final int lenghtQuestions;
  QuestionIndicatorWidget(
      {@required this.currentQuestion, this.lenghtQuestions});
  @override
  _QuestionIndicatorWidgetState createState() =>
      _QuestionIndicatorWidgetState();
}

class _QuestionIndicatorWidgetState extends State<QuestionIndicatorWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Questão ${widget.currentQuestion}',
                style: AppTextStyles.body,
              ),
              Text(
                'de ${widget.lenghtQuestions}',
                style: AppTextStyles.body,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          ProgressIndicatorWidget(
            value: widget.currentQuestion / widget.lenghtQuestions,
            height: 6,
            color: AlwaysStoppedAnimation<Color>(AppColors.green),
          )
        ],
      ),
    );
  }
}
