import 'package:app/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class ScoreWidget extends StatefulWidget {
  double score;
  ScoreWidget({this.score = 0.0});
  @override
  _ScoreWidgetState createState() => _ScoreWidgetState();
}

class _ScoreWidgetState extends State<ScoreWidget>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
      duration: Duration(milliseconds: 1800),
      vsync: this,
    );
    animation = Tween<double>(begin: 0.0, end: widget.score)
        .animate(animationController);
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.85,
      height: 136,
      child: Card(
        margin: EdgeInsets.all(0),
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: ListTile(
              leading: SizedBox(
                height: 50,
                width: 50,
                child: AnimatedBuilder(
                  animation: animation,
                  builder: (context, _) => Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(
                          strokeWidth: 8,
                          value: animation.value,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.green),
                        ),
                      ),
                      Text(
                        '${widget.score}%',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              title: Text(
                'Vamos começar',
                style: AppTextStyles.heading,
              ),
              subtitle: Text(
                'Comece os desáfios e avance seu conhecimento',
                style: AppTextStyles.body,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
