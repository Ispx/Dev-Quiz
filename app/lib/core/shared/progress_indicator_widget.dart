import 'package:flutter/material.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  final double value;
  final Animation color;
  final double height;
  ProgressIndicatorWidget(
      {@required this.value, @required this.color, this.height = 4});
  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      valueColor: this.color,
      value: this.value,
      minHeight: this.height,
    );
  }
}
