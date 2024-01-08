import 'dart:math';

import 'package:flutter/material.dart';

class ClockSecondsTickMarker extends StatelessWidget {
  const ClockSecondsTickMarker({
    required this.seconds,
    required this.radius,
    super.key,
  });

  final int seconds;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final color = seconds % 5 == 0 ? Colors.white : Colors.grey[700];
    const width = 2.0;
    const height = 12.0;

    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..translate(-width / 2, -height / 2)
        ..rotateZ(2 * pi * (seconds / 60))
        ..translate(0.0, radius - height / 2),
      child: Container(height: height, width: width, color: color),
    );
  }
}

class ClockTextMarker extends StatelessWidget {
  const ClockTextMarker({
    required this.value,
    required this.maxValue,
    required this.radius,
    super.key,
  });

  final int value;
  final int maxValue;
  final double radius;

  @override
  Widget build(BuildContext context) {
    const height = 32.0;
    const width = 48.0;

    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..translate(-width / 2, -height / 2)
        ..rotateZ(pi + 2 * pi * (value / maxValue))
        ..translate(0.0, radius * 0.8)
        ..rotateZ(pi - 2 * pi * (value / maxValue)),
      child: SizedBox(
        height: height,
        width: width,
        child: Text(
          '$value',
          style: TextStyle(fontSize: 24),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
