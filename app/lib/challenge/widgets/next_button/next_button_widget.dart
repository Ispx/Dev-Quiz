import 'package:app/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NextButtonWidget extends StatelessWidget {
  final String label;
  final Color colorText;
  final Color colorBackground;
  final Color overlayColor;
  final VoidCallback onPressed;
  NextButtonWidget({
    @required this.label,
    @required this.colorBackground,
    @required this.colorText,
    @required this.onPressed,
    this.overlayColor = Colors.green,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(colorBackground),
          overlayColor: MaterialStateProperty.all(overlayColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        child: Text(
          label,
          style: GoogleFonts.notoSans(
            fontWeight: FontWeight.w900,
            fontSize: 15,
            color: colorText,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
