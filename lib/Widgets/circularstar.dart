import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CircularStat extends StatelessWidget {
  final double percentage;
  CircularStat({this.percentage});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: new CircularPercentIndicator(
        radius: 160.0,
        animation: true,
        animationDuration: 1200,
        lineWidth: 30.0,
        percent: 0.9,
        circularStrokeCap: CircularStrokeCap.square,
        backgroundColor: Colors.yellow,
        progressColor: Colors.red,
      ),
    );
  }
}
