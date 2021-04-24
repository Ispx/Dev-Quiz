import 'package:app/core/app_colors.dart';
import 'package:app/core/app_text_styles.dart';
import 'package:app/core/models/quiz_model.dart';
import 'package:flutter/material.dart';

class QuizCardWidget extends StatefulWidget {
  final QuizModel quizModel;
  final VoidCallback onTap;

  QuizCardWidget({@required this.quizModel, @required this.onTap});

  @override
  _QuizCardWidgetState createState() => _QuizCardWidgetState();
}

class _QuizCardWidgetState extends State<QuizCardWidget> {
  double progressIndicator;

  @override
  Widget build(BuildContext context) {
    progressIndicator = widget.quizModel.questionsAnswered /
            widget.quizModel.questions.length ??
        0;
    return Card(
      margin: EdgeInsets.all(0),
      elevation: 5,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: AppColors.border,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        color: Colors.transparent,
        child: InkWell(
          onTap: widget.onTap,
          splashColor: Colors.blue,
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40,
                  width: 40,
                  child: Image.asset(widget.quizModel.image),
                ),
                Text(
                  widget.quizModel.title,
                  style: AppTextStyles.heading15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        flex: 1,
                        child: Text(
                            '${widget.quizModel.questionsAnswered} de ${widget.quizModel.questions.length}')),
                    Expanded(
                      flex: 2,
                      child: LinearProgressIndicator(
                        value: progressIndicator,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          AppColors.green,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
