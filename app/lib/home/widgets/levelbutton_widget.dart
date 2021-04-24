import 'package:app/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LevelButtonWidget extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  LevelButtonWidget({@required this.label, @required this.onTap})
      : assert(["Fácil", "Médio", "Difícil", "Perito"].contains(label));

  final config = {
    "Fácil": {
      "color": AppColors.levelButtonFacil,
      "borderColor": AppColors.levelButtonTextFacil,
      "fontColor": AppColors.levelButtonTextFacil,
    },
    "Médio": {
      "color": AppColors.levelButtonMedio,
      "borderColor": AppColors.levelButtonTextMedio,
      "fontColor": AppColors.levelButtonTextMedio,
    },
    "Difícil": {
      "color": AppColors.levelButtonDificil,
      "borderColor": AppColors.levelButtonTextDificil,
      "fontColor": AppColors.levelButtonTextDificil,
    },
    "Perito": {
      "color": AppColors.levelButtonPerito,
      "borderColor": AppColors.levelButtonTextPerito,
      "fontColor": AppColors.levelButtonTextPerito,
    }
  };

  Color get color => config[label]['color'];
  Color get borderColor => config[label]['borderColor'];
  Color get fontColor => config[label]['fontColor'];

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(28),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(28),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 26, vertical: 6),
          decoration: BoxDecoration(
            color: this.color,
            border: Border.fromBorderSide(
              BorderSide(
                color: this.borderColor,
              ),
            ),
            borderRadius: BorderRadius.circular(28),
          ),
          child: Text(
            label,
            style: GoogleFonts.notoSans(
              color: this.fontColor,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }
}
