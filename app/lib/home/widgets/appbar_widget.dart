import 'dart:ui';

import 'package:app/core/app_gradients.dart';
import 'package:app/core/app_text_styles.dart';
import 'package:app/core/models/user_model.dart';
import 'package:app/home/widgets/score_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends PreferredSize {
  UserModel userModel;
  AppBarWidget({@required this.userModel})
      : super(
          preferredSize: Size.fromHeight(180),
          child: Container(
            decoration: BoxDecoration(
              gradient: AppGradients.linear,
            ),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment(0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: 'Olá, ',
                          style: AppTextStyles.title,
                          children: [
                            TextSpan(
                              text: userModel.name,
                              style: AppTextStyles.titleBold,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 58,
                        width: 58,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(userModel.photoUrl),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                    alignment: Alignment(0.0, 4.0),
                    child: ScoreWidget(score: userModel.score))
              ],
            ),
          ),
        );
}
