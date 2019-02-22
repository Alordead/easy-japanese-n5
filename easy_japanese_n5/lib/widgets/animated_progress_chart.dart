import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';

class AnimatedProgressChart extends StatelessWidget {

  final int totalCount;
  final int completedCount;

  AnimatedProgressChart({this.totalCount = 0, this.completedCount = 0});

  @override
  Widget build(BuildContext context) {
    return _animatedProgressChartWidget(context);
  }

  Widget _animatedProgressChartWidget(BuildContext context) {

    final double completedCountPercent = 100 / totalCount * completedCount;
    final double remainingCountPercent = 100 - completedCountPercent;

    return AnimatedCircularChart(
      key: GlobalKey<AnimatedCircularChartState>(),
      size: Size(150.0, 150.0),
      initialChartData: <CircularStackEntry>[
        new CircularStackEntry(
          <CircularSegmentEntry>[
            new CircularSegmentEntry(
              completedCountPercent,
              Theme.of(context).primaryColor,
              rankKey: 'completed',
            ),
            new CircularSegmentEntry(
              remainingCountPercent,
              Theme.of(context).primaryColor.withOpacity(0.3),
              rankKey: 'remaining',
            ),
          ],
          rankKey: 'progress',
        ),
      ],
      chartType: CircularChartType.Radial,
      percentageValues: true,
      holeLabel: "$completedCount/$totalCount",
      labelStyle: new TextStyle(
        color: Colors.blueGrey[600],
        fontWeight: FontWeight.bold,
        fontSize: 24.0,
      ),
    );
  }

}