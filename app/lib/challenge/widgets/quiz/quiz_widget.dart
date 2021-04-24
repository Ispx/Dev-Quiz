import 'package:app/challenge/widgets/answer/answer_widget.dart';
import 'package:app/core/app_text_styles.dart';
import 'package:app/core/models/question_model.dart';
import 'package:flutter/widgets.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel questionModel;
  Function(int index) onSelected;
  QuizWidget({@required this.questionModel, @required this.onSelected});

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int isSelected = -1;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 25,
          ),
          Text(
            widget.questionModel.title,
            style: AppTextStyles.heading,
          ),
          SizedBox(
            height: 25,
          ),
          for (int i = 0; i < widget.questionModel.answers.length; i++)
            AnswerWidget(
              title: widget.questionModel.answers[i].title,
              isRight: widget.questionModel.answers[i].isRight,
              isSelected: isSelected == i,
              onTap: isSelected == -1
                  ? () {
                      isSelected = i;
                      widget.onSelected(isSelected);
                      setState(() {});
                    }
                  : null,
            )
        ],
      ),
    );
  }
}
