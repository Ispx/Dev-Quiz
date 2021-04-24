import 'package:app/core/core.dart';
import 'package:flutter/material.dart';

class AnswerWidget extends StatelessWidget {
  final String title;
  final bool isRight;
  final bool isSelected;
  final VoidCallback onTap;
  AnswerWidget({
    @required this.title,
    @required this.isRight,
    @required this.isSelected,
    @required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isRight == true && isSelected == true
              ? AppColors.green
              : isRight == false && isSelected
                  ? AppColors.red
                  : AppColors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColors.border,
          ),
        ),
        padding: EdgeInsets.all(16),
        child: ListTile(
          shape: RoundedRectangleBorder(),
          title: Text(
            this.title,
          ),
          trailing: isRight == true && isSelected == true
              ? Icon(Icons.check_circle, color: Colors.green)
              : isRight == false && isSelected
                  ? Icon(
                      Icons.highlight_off,
                      color: Colors.red,
                    )
                  : Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        border: Border.fromBorderSide(
                          BorderSide(
                            color: AppColors.border,
                          ),
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
        ),
      ),
    );
  }
}
